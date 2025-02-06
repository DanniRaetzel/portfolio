# MATLAB Signal Processing: Time-Domain Analysis of Audio Signals

## Project Overview
This project involves analyzing and processing three different audio signals in the time domain using MATLAB. The main objectives include understanding and visualizing signal properties, performing operations like downsampling and fade-out, and comparing stereo channels. The analysis provides insights into basic signal processing techniques.

---

## Key Tasks and Results
1. **Audio Signal Analysis**:
   - **Samples Count**: Determined the total number of samples for all three signals.
   - **Min/Max Values**: Calculated the minimum and maximum amplitudes.
   - **RMS Values**: Computed the root mean square values for signal strength.
   - **Energy**: Estimated the total energy of each signal.

2. **Stereo Channel Difference**:
   - Analyzed the difference between left and right stereo channels.
   - Observed how mid-signal cancellation highlights peripheral sounds.

3. **Downsampling**:
   - Performed downsampling by a factor of 4 on one of the signals.
   - Evaluated the quality loss and distortion due to reduced sampling frequency.

4. **Fade-Out Implementation**:
   - Created a **linear fade-out** for the last third of the signal.
   - Created an **exponential fade-out** for a more natural attenuation of amplitude.
   - Plotted and compared both fade-out types to evaluate their effectiveness.
