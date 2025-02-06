Digital Shelving Filter for Audio Processing

Project Overview

This project focuses on the implementation and analysis of a second-order digital shelving filter in MATLAB. Shelving filters are commonly used in audio processing to boost or attenuate specific frequency ranges, such as bass and treble.

Objectives

Implement a second-order shelving filter using custom MATLAB functions.

Compare the custom filter with MATLAB's built-in filtering functions.

Analyze frequency response and evaluate filter effects on an audio signal.

Test practical applications of bass and treble adjustments.

Key Tasks and Findings

Filter Implementation

Developed a custom shelving filter function that calculates coefficients for both bass and treble adjustments.

Implemented an IIR filter in direct form I to apply the shelving effect in a cascaded manner.

Normalized filter coefficients to ensure stability and correct response.

Filter Evaluation

Applied the shelving filter to an audio signal and compared the output to MATLAB’s built-in filtering functions.

Measured frequency response using freqz to visualize amplitude and phase characteristics.

Results confirmed that the custom function produces identical filtering effects as MATLAB's standard implementation.

Practical Applications

Tested filter effects with different gain and cutoff frequencies.

Observed how increasing bass gain made the sound deeper and more pronounced, while reducing it made it thinner.

Noted how adjusting treble gain affected the clarity and brightness of the sound.

Changing cutoff frequencies influenced the tonal balance of the processed audio.

Conclusion

The project successfully demonstrated the implementation and evaluation of a second-order digital shelving filter in MATLAB. The custom function performed equivalently to MATLAB’s built-in filter functions. Practical tests confirmed the filter’s effectiveness in controlling bass and treble levels, making it useful for real-world audio enhancement.

Repository Contents

Project Report (PDF): Comprehensive documentation of the implementation and evaluation.

MATLAB Scripts: Code for designing, applying, and testing the shelving filter.

Filtered Audio Files: Example outputs showcasing the effect of different filter settings.

Tools Used

MATLAB for digital signal processing and visualization.

IIR filtering techniques for real-time audio adjustments.

Frequency analysis using freqz for amplitude and phase response evaluation.

This project serves as a fundamental exploration of digital audio processing, particularly in the application of frequency-based sound shaping through shelving filters.


