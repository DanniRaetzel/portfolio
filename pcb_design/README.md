
Lap Counter for Pololu Robot

Project Overview

This project involves the design and implementation of a lap counter used with a Pololu robot running a line follower program. The lap counter was developed as part of a 24-hour endurance race to accurately track the number of laps completed by the robot.

Functionality

The lap counter uses a reflection-based optical sensor to detect laps as the Pololu robot crosses the finish line. The sensor's output is processed by a binary decade counter (74LS90) and displayed on a 7-segment display using a binary-to-7-segment driver (74LS47). The system is designed to avoid counting errors and ensures precise lap tracking throughout the race.

Key Features

Accurate lap counting: Detects and increments lap count as the robot passes the sensor.

Reset functionality: Includes a reset button with Schmitt-trigger-based debouncing to prevent accidental resets due to electrical noise.

Robust design: Features protection against false detections caused by reflective materials on the track.

Hardware Details

Components Used:

74LS90: Binary decade counter.

74LS47: Binary-to-7-segment decoder/driver.

Optical sensor: For lap detection.

Schmitt trigger: Debouncing the reset button.

Resistors, capacitors, and other passive components.

PCB Design:

Designed in KiCad, featuring separate traces for power and signal paths to minimize noise.

Compact layout with space for additional features if needed.

Software

No software is directly involved in the lap counter as it is implemented entirely with hardware components.

Assembly and Setup

Assemble the PCB:

Solder all components onto the PCB following the provided schematic and layout.

Connect Power:

Use a regulated 5V power supply to power the system.

Mount the Sensor:

Position the optical sensor appropriately on the track for accurate lap detection.

Test the System:

Run the Pololu robot and observe the lap counter's display to ensure proper operation.

Usage Instructions

Turn on the power supply to activate the lap counter.

Reset the counter before starting the race by pressing the reset button.

The 7-segment display will show the current lap count.
