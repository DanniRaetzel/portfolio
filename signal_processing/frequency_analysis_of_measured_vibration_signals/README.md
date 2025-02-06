
Signal Processing: Frequency Analysis of Measured Vibration Signals

Project Overview

This project focuses on the frequency analysis of vibrations measured using an accelerometer mounted on a bearing in an offshore wind turbine. The data is processed using discrete Fourier transformation (DFT) in MATLAB to identify dominant frequency components and assess signal characteristics.

Objectives

Analyze time-domain properties of the vibration signal

Perform DFT to examine frequency content

Compute key signal parameters such as DC mean value, RMS, and energy

Compare frequency spectra with and without windowing techniques

Investigate energy distribution across frequency ranges

Apply smoothing techniques to refine the spectrum

Key Tasks and Findings

Time-Domain Analysis

The first 5 seconds of the signal were plotted to visually assess periodic components.

Expected frequency components were estimated based on visible time-domain patterns.

DC mean, AC RMS, and energy values were computed, confirming dominant signal characteristics.

Frequency-Domain Analysis

The DC component was removed before applying DFT.

Frequency spectra were plotted using both linear and logarithmic scales.

The dominant frequency was identified at approximately 6147 Hz, differing slightly from initial estimations.

Energy distribution between low (<1000 Hz) and high (≥1000 Hz) frequencies was computed, showing significantly more energy in the higher frequency range.

Signal Processing Enhancements

A Hanning window was applied to mitigate spectral leakage, with minimal effect in this case due to the signal’s stability.

Smoothing was applied to the spectrum to improve clarity in frequency component identification.

The processed spectrum confirmed the presence of key frequency components indicative of mechanical vibrations.

Conclusion

The analysis successfully identified dominant frequencies within the vibration signal, correlating well with expected mechanical behavior of the wind turbine. The application of windowing and smoothing techniques provided additional insights into spectral characteristics. The findings highlight the importance of frequency-domain analysis in assessing system health and diagnosing potential issues.

Repository Contents

Project Report (PDF): Detailed documentation of the analysis, findings, and MATLAB scripts.

MATLAB Files: Scripts for performing time and frequency analysis, including DFT computation and signal enhancements.

Plots and Data: Visual representations of time and frequency-domain analyses.

Tools Used

MATLAB for signal processing and visualization

Discrete Fourier Transform (DFT) for frequency analysis

Hanning windowing and smoothing for spectral refinement

This project serves as an example of practical signal processing techniques applied to real-world mechanical systems, particularly in the context of wind turbine monitoring and vibration analysis.

