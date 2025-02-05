/*
=================================================================
Programnavn : Kalkknuser.ino
Forfatter   : Danni Raetzel
Version     : 1.0
Dato        : 23.04.2024
Ophavsret   : Åben for alle
Beskrivelse : Dette program styrer en enhed designet til at knuse kalk
              i vandforsyningssystemer. Det justerer automatisk 
              intensiteten af behandlingen baseret på målte vandhårdhedsdata,
              der modtages via en Blynk app. Programmet inkluderer funktioner
              for at initialisere systemet, opdatere behandlingsniveauer og
              interagere med brugerinput gennem Blynk-grænsefladen.
=================================================================
*/


// Definerer information til Blynk projektet
#define BLYNK_TEMPLATE_ID "TMPL56XGE4HXW"
#define BLYNK_TEMPLATE_NAME "Projekt"

#include <Arduino.h>       // Grundlæggende bibliotek for Arduino
#include <WiFi.h>          // Bibliotek for WiFi-funktionalitet
#include <BlynkSimpleEsp32.h>  // Bibliotek for at forbinde ESP32 med Blynk
#include "PostData.h"      // Indlæser en headerfil med data for postnumre

#define BLYNK_PRINT Serial  // Aktiverer Blynk bibliotekets udskrift til seriel monitor

// Autorisationstoken fra Blynk appen
char auth[] = "trjwaSDjYYcqG1B3Qd0OeMTkjWT9sBmn";

// WiFi-netværksoplysninger
char ssid[] = "internetNavn";
char pass[] = "InternetKode";

// Konfiguration af PWM-pin
const int pwmPin = 2;
const int pwmChannel = 0;
const int freq = 5000;
const int resolution = 8;

// Variabler til styring af PWM
int selectedPostNr = 7400;  // Standard postnummer
float magneticField = 0.0;  // Variabel til at holde værdien af det magnetiske felt
const float mu_0 = 1.25663706e-6;  // Vakuumpermeabiliteten (henry per meter, H/m)
const float mu_r = 250;  // Relativ permeabilitet for materialet
const float n = 22;  // Antal viklinger per centimeter

// Finder data for et specifikt postnummer
PostData* findPostData(int postNr) {
  for (int i = 0; i < postDataSize; i++) {
    if (postData[i].postNr == postNr) {
      return &postData[i];
    }
  }
  return nullptr;
}

// Opdaterer det magnetiske felt baseret på valgt postnummer
void updateMagneticField() {
  PostData* data = findPostData(selectedPostNr);
  if (data != nullptr) {
    float OM = 1.145681818;
    float GR = data->hardhed > 1 ? 0.1 : 0.05; // Justerer GR baseret på vandets hårdhed
    float pH = data->pH; // Gemmer pH-værdien fra data
    
    Blynk.virtualWrite(V6, data->kommune); // Sender kommunenavn til Blynk
    
    // Beregner det magnetiske felt
    magneticField = GR * 0.044 + OM * -0.0133 + pH * 0.0246;

    // Sender det magnetiske felt til Blynk
    Blynk.virtualWrite(V5, magneticField);

    // Beregner den ønskede strømstyrke og konverterer til PWM duty cycle
    float desiredCurrent = magneticField / (mu_0 * mu_r * n / 10); // Omregner B til I
    float dutyCycle = mapFloat(desiredCurrent, 0, 1410, 0, 255); // Mapper til PWM værdi
    dutyCycle = constrain(dutyCycle, 0, 255); // Sørg for at dutyCycle er inden for grænserne
    ledcWrite(pwmChannel, (int)dutyCycle); // Skriver dutyCycle til PWM-pin
  }
}

// Konverterer en strømværdi 'x' til en tilsvarende PWM duty cycle værdi inden for det angivne område.
float mapFloat(float x, float in_min, float in_max, float out_min, float out_max) {
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

// Funktion til at håndtere skrivninger fra Blynk appen til V3
BLYNK_WRITE(V3) {
  selectedPostNr = param.asInt();  // Opdaterer postnummeret med værdi fra Blynk
  updateMagneticField();           // Opdaterer det magnetiske felt
}

// Initialiserer systemet
void setup() {
  Serial.begin(115200);       // Starter seriel kommunikation
  Blynk.begin(auth, ssid, pass);  // Forbinder til Blynk med autentificering og WiFi
  ledcSetup(pwmChannel, freq, resolution); // Sætter PWM-kanalen op
  ledcAttachPin(pwmPin, pwmChannel);      // Tilknytter PWM-kanalen til en pin
  ledcWrite(pwmChannel, 51);  // Starter med en PWM duty cycle på 20% default
}

// Hovedløkke der kører gentagne gange
void loop() {
  Blynk.run();  // Kører Blynk-funktionaliteten
}
