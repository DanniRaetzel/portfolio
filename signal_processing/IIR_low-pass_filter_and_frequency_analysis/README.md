
IIR Low-Pass Filter and Frequency Analysis

Project Overview

This project focuses on the development and implementation of a second-order IIR low-pass filter to analyze and filter noisy signals. The goal is to improve frequency measurement accuracy by attenuating high-frequency noise using different filtering techniques and evaluating their effectiveness.

Objectives

Design and implement a second-order IIR low-pass filter.

Apply the filter to noisy signals and analyze its effectiveness.

Compare different filter designs: Butterworth, Chebyshev, and Elliptic filters.

Implement a Zero Crossing algorithm for frequency estimation.

Evaluate the accuracy of frequency detection based on the filtered signals.

Key Tasks and Findings

Signal Analysis

Two signals were analyzed: one clean and one with harmonic noise.

A time-domain and frequency-domain analysis was conducted using FFT.

Frequency resolution was calculated, demonstrating the need for higher sampling rates or longer signals for improved accuracy.

IIR Filter Design

Designed Butterworth, Chebyshev Type 1, and Elliptic filters to attenuate high-frequency components.

Compared their characteristics in terms of passband ripple, stopband attenuation, and phase response.

Butterworth filter provided the smoothest response but slower roll-off.

Chebyshev and Elliptic filters offered steeper attenuation but introduced ripple in the passband.

Zero Crossing Algorithm Implementation

Implemented a zero crossing detection algorithm to estimate the fundamental frequency of the filtered signals.

Used interpolation techniques to refine frequency calculations.

Frequency estimates were compared against the expected value of 50.1111 Hz.

Accuracy Evaluation

Calculated frequency deviations for different filters.

The Elliptic filter produced the lowest deviation at approximately 80.7 mHz, but still exceeded the desired accuracy of ±10 mHz.

The study indicated that increasing the sampling rate or signal duration would improve frequency estimation precision.

Conclusion

The project demonstrated the effectiveness of IIR filtering in removing noise from signals to improve frequency measurement accuracy. While filtering reduced errors, achieving the desired accuracy required higher sampling rates or longer signal durations. The study highlighted trade-offs between filter design complexity, computational efficiency, and measurement precision.

Repository Contents

Project Report (PDF): Detailed documentation of the analysis and findings.

MATLAB Scripts: Code for signal processing, filter implementation, and frequency analysis.

Filtered Signals: Processed data showing the impact of different filtering techniques.

Tools Used

MATLAB for signal processing and visualization.

IIR filtering techniques for real-time signal noise reduction.

FFT and zero crossing algorithms for frequency analysis.

This project provides practical insights into digital signal processing techniques for accurate frequency measurement and noise reduction.
