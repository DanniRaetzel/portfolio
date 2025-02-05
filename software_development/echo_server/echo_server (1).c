/*
 ============================================================================
 Name        : echo_server.c
 Author      : Danni
 Version     : 1.0.0-beta-fix-final-for-real-this-time
 Copyright   : Your copyright notice
 Description : echo server, end with CTRL + D
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <pthread.h>
#include <semaphore.h>

#define PORT 8080                  // Port number the server listens on
#define BUFFER_SIZE 1024           // Buffer for storing data from clients
#define MAX_ACTIVE_CONNECTIONS 5   // Maximum number of active connections
#define MAX_QUEUE 5                // Maximum queue length

// Global semaphore to limit the number of active connections
sem_t active_connections;

// Mutex for synchronizing queue number updates
pthread_mutex_t queue_mutex = PTHREAD_MUTEX_INITIALIZER;
int waiting_clients = 0;  // Counter for clients waiting in the queue

typedef struct {
    int client_socket;
    int queue_position;
} ClientInfo;

ClientInfo waiting_queue[MAX_QUEUE];  // Array to store information about waiting clients

// Function to handle each client connection
void *handle_client(void *socket_desc) {
    int new_socket = *(int *)socket_desc;
    char buffer[BUFFER_SIZE];
    ssize_t valread;

    // Inform the client that they are now connected
    char *active_msg = "You are now an active connection. Start sending messages.\n";
    send(new_socket, active_msg, strlen(active_msg), 0);

    printf("Thread started for client\n");

    // Read data from the client and echo it back
    while ((valread = read(new_socket, buffer, BUFFER_SIZE)) > 0) {
        buffer[valread] = '\0';  // Null-terminate the buffer correctly
        printf("Received from client: %s\n", buffer);

        // Echo the received message back to the client
        send(new_socket, buffer, strlen(buffer), 0);

        // Stop condition: CTRL+D (EOF)
        if (strstr(buffer, "\x04") != NULL) {
            printf("Client sent EOF, closing connection\n");
            break;
        }
    }

    // Close the socket when the connection ends
    close(new_socket);
    printf("Connection closed, freeing slot for another client\n");

    // Release the semaphore slot so other clients can be served
    sem_post(&active_connections);

    free(socket_desc);  // Free dynamically allocated memory
    return NULL;
}

void update_queue_positions() {
    pthread_mutex_lock(&queue_mutex);
    for (int i = 0; i < waiting_clients; i++) {
        // Update queue position for each client in the waiting list
        waiting_queue[i].queue_position--;

        // Inform the client about their new queue position
        char queue_msg[BUFFER_SIZE];
        snprintf(queue_msg, sizeof(queue_msg), "Your new queue position is: %d. Please wait...\n", waiting_queue[i].queue_position);
        send(waiting_queue[i].client_socket, queue_msg, strlen(queue_msg), 0);
    }
    pthread_mutex_unlock(&queue_mutex);
}

void *queue_handler(void *new_sock_ptr) {
    int *new_sock = (int *)new_sock_ptr;

    // Lock the mutex before modifying the queue number
    pthread_mutex_lock(&queue_mutex);
    waiting_queue[waiting_clients].client_socket = *new_sock;
    waiting_queue[waiting_clients].queue_position = waiting_clients + 1;
    waiting_clients++;  // Increment the queue number for waiting clients
    int current_queue_number = waiting_queue[waiting_clients - 1].queue_position;
    pthread_mutex_unlock(&queue_mutex);

    // Inform the client of their current queue position
    char queue_msg[BUFFER_SIZE];
    snprintf(queue_msg, sizeof(queue_msg), "You are currently in queue, position: %d. Please wait...\n", current_queue_number);
    send(*new_sock, queue_msg, strlen(queue_msg), 0);

    // Wait for available active connection slots
    sem_wait(&active_connections);

    // Once the client becomes active, remove them from the waiting queue
    pthread_mutex_lock(&queue_mutex);
    for (int i = 0; i < waiting_clients; i++) {
        if (waiting_queue[i].client_socket == *new_sock) {
            // Remove this client from the queue
            for (int j = i; j < waiting_clients - 1; j++) {
                waiting_queue[j] = waiting_queue[j + 1];
            }
            waiting_clients--;  // Decrement waiting clients count
            break;
        }
    }
    pthread_mutex_unlock(&queue_mutex);

    // Update the queue for the remaining clients
    update_queue_positions();

    // Create a thread to handle the client
    pthread_t client_thread;
    if (pthread_create(&client_thread, NULL, handle_client, (void *)new_sock) < 0) {
        perror("could not create thread");
        free(new_sock);
        sem_post(&active_connections);  // Release semaphore in case of failure
        return NULL;
    }

    // Detach the thread to avoid memory leaks
    pthread_detach(client_thread);

    return NULL;
}

int main() {
    int server_fd, new_socket, *new_sock;
    struct sockaddr_in address, client_address;
    socklen_t addrlen = sizeof(address);

    // Step 1: Create a TCP socket
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) {
        perror("socket failed");
        exit(EXIT_FAILURE);
    }

    // Step 2: Define server's address and port
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(PORT);

    // Step 3: Bind the socket to the specified IP address and port
    if (bind(server_fd, (struct sockaddr *)&address, sizeof(address)) < 0) {
        perror("bind failed");
        close(server_fd);
        exit(EXIT_FAILURE);
    }

    // Step 4: Listen for incoming connections
    if (listen(server_fd, MAX_QUEUE) < 0) {
        perror("listen failed");
        close(server_fd);
        exit(EXIT_FAILURE);
    }

    printf("Server listening on port %d\n", PORT);

    // Initialize the semaphore to limit active connections
    sem_init(&active_connections, 0, MAX_ACTIVE_CONNECTIONS);

    // Handle incoming connections continuously
    while (1) {
        new_sock = malloc(sizeof(int));
        if ((*new_sock = accept(server_fd, (struct sockaddr *)&client_address, &addrlen)) < 0) {
            perror("accept failed");
            free(new_sock);
            continue;
        }

        // Create a separate thread to handle queue and connection management
        pthread_t queue_thread;
        if (pthread_create(&queue_thread, NULL, queue_handler, (void *)new_sock) < 0) {
            perror("could not create thread");
            free(new_sock);
            continue;
        }

        // Detach the thread to avoid memory leaks
        pthread_detach(queue_thread);
    }

    // Clean up resources when done
    close(server_fd);
    sem_destroy(&active_connections);
    return 0;
}