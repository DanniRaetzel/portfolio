
# Magnetic Water Treatment System

This project explores a **magnetic water treatment system** designed to reduce limescale buildup in household water. The system uses an **ESP32 microcontroller** to generate a **PWM-controlled electromagnetic field**, influencing the crystallization process of calcium carbonate to favor **aragonite formation over calcite**, thereby reducing scale deposits.

## 🔧 Project Overview
- **Technology:** ESP32-based PWM control for electromagnet generation  
- **Objective:** Reduce limescale buildup in water pipes using a controlled magnetic field  
- **Components:**  
  - **Hardware:** Custom PCB, electromagnetic coil, MOSFET switching circuit  
  - **Software:** ESP32 firmware, Blynk app integration for remote control  
  - **Theoretical Basis:** Studies on calcium carbonate crystallization and magnetic field effects  
- **Testing:** Functional verification, oscilloscope measurements, and water hardness tests  

## ⚙️ System Components
### **1️⃣ ESP32 Microcontroller**
- Controls the **PWM signal** to regulate the electromagnetic coil.  
- Processes **user input** from the **Blynk mobile app** to adjust power settings.  
- Connects via **Wi-Fi** for remote control.  

### **2️⃣ Electromagnetic Coil & PCB**
- Custom **PCB design** includes **MOSFET switching circuit** for controlled power delivery.  
- Coil generates a **magnetic field** around the water pipe to alter calcium carbonate crystallization.  

### **3️⃣ Blynk IoT Integration**
- Allows users to **adjust magnetic field strength** remotely.  
- Uses a **slider** in the Blynk app to control **PWM duty cycle** dynamically.  

---

## 🛠️ Testing & Results
- ✅ **Oscilloscope measurements** confirm correct PWM waveform generation.  
- ✅ **Functional tests** show correct magnet field modulation.  
- ⚠️ **Water hardness tests** confirm changes in limescale formation in still water.  
- 🔍 **Ongoing work**: Further testing needed for **flowing water conditions**.  

---

## 🚀 Future Improvements
- Improve the **installation method** for better usability.  
- Optimize **power consumption** for more energy-efficient operation.  
- Implement **more precise tuning of PWM** for varying water conditions.  
- Explore **better test methods** for flowing water experiments.  

---

## 📌 How to Use
1. **Set up the ESP32** by flashing the firmware from the `software/src/` folder.  
2. **Install the Blynk app** and connect the ESP32 to a **Wi-Fi network**.  
3. **Adjust the magnetic field** using the Blynk app slider to match water hardness.  
4. **Monitor performance** using oscilloscope and water tests.  

---

## 👥 Contributors
- **Danni Raetzel**
- Kasper David Arberg Nielsen  
- Lucie Mandøe  
- Martin Elken  
- Mikkel Amstrup Brandt Neiiendam  
