# LoRa Simulation in MATLAB

This project simulates a **LoRa (Long Range) communication system** using MATLAB. It demonstrates the modulation, transmission over a noisy channel, and demodulation of data, as well as calculating the **Bit Error Rate (BER)**.

## Features
- LoRa modulation and demodulation using **Chirp Spread Spectrum (CSS)**
- Simulation of a noisy channel using **AWGN**
- Calculation of **Bit Error Rate (BER)**
- Monte Carlo simulations to evaluate average BER

## LoRa Parameters
- Spreading Factor (SF)
- Bandwidth (BW)
- Coding Rate (CR)
- Signal-to-Noise Ratio (SNR)

## How to Run
1. Open MATLAB.
2. Load the `LoRa_simulation.m` or `LoRa_MonteCarlo.m` files.
3. Run the script.
4. The output will display the **number of bit errors** and **BER**.

## Requirements
- MATLAB
- Communications Toolbox (for AWGN simulation)

## Reference
- [Semtech LoRa Technology](https://www.semtech.com/lora)

## About LoRa
LoRa devices by Semtech are **low-power, long-range wireless chips** used in IoT networks for applications such as energy management, pollution monitoring, and disaster prevention. LoRa uses **sub-gigahertz unlicensed frequency bands** to achieve long-range communication over 10 km with very high link budgets (155–170 dB), making it possible to cover cities or even countries with minimal infrastructure.
