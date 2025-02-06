
# PCB Project: Simple Power Control Module

This repository contains the design files, schematics, and PCB layout for a simple power control module. This module is designed to handle 5V power distribution with basic protection and indication features.

---

## Features
- **Input Voltage:** 5V DC
- **LED Indicator:** Indicates power is supplied
- **MOSFET Switch:** Controlled 5V output for additional circuits
- **Reverse Polarity Protection:** Using a 1N4007 diode
- **Compact Design:** Easy to integrate into various projects

---

## Schematic Overview
The schematic includes:
1. **Power Input (J1):** Standard barrel jack for 5V input.
2. **LED Indicator (D1):** Connected via a 330Ω resistor (R1) to indicate power supply status.
3. **MOSFET Switch (Q1):** BTS129 for high-current switching capabilities.
4. **Reverse Polarity Protection (D2):** 1N4007 diode ensures the circuit is protected against incorrect power supply connections.
5. **Pull-down Resistor (R3):** 100kΩ to ensure stable MOSFET operation.
6. **Output Connectors (J4, J5):** For connecting external components or devices.

---

## PCB Layout
The PCB design includes:
- Clearly labeled connectors for easy assembly and troubleshooting.
- A compact, double-layer layout optimized for signal integrity and power handling.
- Proper placement of bypass capacitor (C1, C2) for noise reduction.

### Notable Design Elements
- A playful silkscreen message: *"If you can read this, your warranty just left the building."*
- All components are through-hole for easy soldering and prototyping.

---

## Assembly Instructions
1. Solder the components in the following order:
   - Resistors (R1, R2, R3)
   - Capacitors (C1, C2)
   - Diodes (D1, D2)
   - MOSFET (Q1)
   - Connectors (J1, J4, J5)
2. Ensure proper orientation for polarized components (diodes, capacitors, and MOSFET).
3. Connect a 5V power source to J1 and verify the LED (D1) lights up.
4. Connect the output device to J4 or J5 for controlled power output.

---

## Testing
1. Verify the LED lights up when power is applied to the input.
2. Use a multimeter to check for 5V output at J4/J5 when the MOSFET is active.
3. Test reverse polarity protection by connecting the power supply in reverse; the circuit should not be damaged.

---

## Applications
- DIY projects requiring controlled 5V power output
- Prototyping circuits with basic power needs
- Educational purposes for understanding PCB design and power management

---

## File Information
- `pcb_kicad.png`: Top and bottom PCB layouts.
- `pcb_kicad_front_3D.png`: Front 3D view of the PCB.
- `pcb_kicad_back_3D.png`: Back 3D view of the PCB.
- `pcb_schematic.png`: Circuit schematic.
