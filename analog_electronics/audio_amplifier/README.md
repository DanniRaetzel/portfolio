# Audio Amplifier Project

This project demonstrates the design and implementation of a three-stage audio amplifier with a frequency range of 20 Hz to 20 kHz. The amplifier focuses on minimizing distortion, ensuring appropriate signal amplification, and optimizing efficiency. The design consists of:
- **Differential Input Stage**
- **Common Emitter Gain Stage**
- **Push-Pull Output Stage**

## Features
- **Frequency Range:** 20 Hz to 20 kHz
- **Gain:** Achieved a measured gain of ~7.8
- **Efficiency:** Approximately 30.6% for the push-pull stage
- **Low Distortion:** Utilizes class AB configuration to reduce crossover distortion
- **Simulation and Measurement:** Includes both simulated and measured results

## File Structure
- **`schematic/`**
  - Contains the Multisim simulation file and schematic images of the amplifier.
- **`photos/`**
  - Includes photos of the breadboard setup and the simulated circuit in Multisim.
- **`report/`**
  - The complete project report detailing the design, analysis, and results.

## Design Stages
### Differential Input Stage
- Amplifies the difference between two input signals and suppresses noise using a high CMRR (Common Mode Rejection Ratio).
- Features a current mirror for stable operation.

### Common Emitter Gain Stage
- Provides linear amplification with low distortion using a class A configuration.
- Achieved a calculated gain of ~17.8.

### Push-Pull Output Stage
- Combines NPN and PNP transistors for efficient signal amplification.
- Class AB operation minimizes crossover distortion and improves efficiency.

## Results
- Simulated input signal amplitude: 100.54 mV
- Simulated output signal amplitude: 769.93 mV
- Measured input signal amplitude: 99.95 mV
- Measured output signal amplitude: 787.65 mV
- Efficiency: 30.6%
- Gain: ~7.8

## Future Improvements
- Optimize component values to reduce heat loss in the push-pull stage.
- Explore adjustments to supply voltage to enhance overall performance.

## Usage
1. Open the Multisim file in the `schematic/` folder to view or simulate the circuit.
2. Refer to the `report/` folder for detailed documentation of the project.
3. View the `photos/` folder for visuals of the implementation.

## Contributors
- Danni Raetzel
- Lucie Mandøe
- Martin Armose
- Mikkel Amstrup Brandt Neiiendam
