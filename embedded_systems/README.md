# FPGA ADC Converter

This project implements an **Analog-to-Digital Converter (ADC)** using an FPGA and a **Finite State Machine (FSM)** for control. The system converts an analog voltage into an 8-bit digital value and displays the result on a **7-segment display**.

## 🔧 Project Overview
- **ADC Type:** Counting ADC  
- **Resolution:** 8-bit (256 steps, ~13mV per step)  
- **Voltage Range:** 0V - 3.3V  
- **Control System:** FSM manages ADC process  
- **Display:** 7-segment display visualization  
- **Clock Speed:** 100 MHz  

## 📁 File Structure
fpga_adc_converter/ │── README.md # Project documentation
│── src/ # VHDL source files
│ ├── adc.vhd # Main ADC module
│ ├── fsm.vhd # Finite State Machine for ADC
│ ├── scaling_unit.vhd # Scaling unit for output
│ ├── testbench.vhd # Testbench for simulation
│── constraints/ # FPGA pin assignments
│ ├── constraints.xdc # Xilinx constraints file
│── schematic/ # Circuit schematics
│ ├── schematic.png # ADC system diagram
│── simulation/ # Simulated waveforms and test results
│ ├── waveform.png # Timing analysis output
│── photos/ # Images of FPGA setup
│ ├── board_setup.jpg # FPGA and connected components
│── report/ # Project documentation
│ ├── fpga_adc_report.pdf # Full project report

markdown
Kopiér
Rediger

## ⚙️ System Components
### **1️⃣ Finite State Machine (FSM)**
- Controls ADC operation, ensuring a stepwise conversion.
- Handles state transitions for **Idle → Start → Convert → Complete**.

### **2️⃣ ADC Module**
- Converts analog input to an 8-bit digital value.
- Uses an **R-2R resistor ladder** for reference voltage comparison.
- Outputs data for visualization.

### **3️⃣ Scaling Unit**
- Converts ADC output into **millivolt values**.
- Formats values for a **7-segment display**.

### **4️⃣ Display Multiplexer**
- Controls **which digit** of the **7-segment display** is active at any given time.

## 🛠️ Simulation & Results
- ✅ **FSM correctly transitions through states**.
- ✅ **ADC properly counts up and stops at correct voltage**.
- ⚠️ **Simulation issues**: Display output remains constant in some cases.
- 🔍 **Further debugging needed** for final implementation.

## 🚀 Future Improvements
- Debug display update logic in FSM.
- Improve ADC accuracy and ensure real-time responsiveness.
- Optimize FPGA constraints for better stability.

## 📌 Usage
1. Open and analyze **VHDL files** in `src/`.
3. View **schematic** in `schematic/` for circuit design.
4. Check `report/` for full documentation.

## 👥 Contributors
- **Danni Raetzel**
- Lucie Mandøe
- Martin Elken
- Mikkel Amstrup Brandt Neiiendam
- Kasper David Arberg
