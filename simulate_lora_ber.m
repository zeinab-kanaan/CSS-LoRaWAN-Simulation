% Define LoRa parameters
SF = 12; % Spreading Factor
BW = 125e6; % Bandwidth
CR = 4/5; % Coding Rate
SNR = 10; % Signal-to-Noise Ratio

num_simulations = 100; % Number of Monte Carlo simulations

total_bit_errors = 0;

for sim = 1:num_simulations
    % Generat   e random data to transmit
    data = randi([0 1], 1, 1000);

    % Modulate data using LoRa modulation scheme
    modulated_data = lora_modulate(data, SF, BW, CR);

    % Simulate the channel (adding noise)
    noisy_data = awgn(modulated_data, SNR);

    % Demodulate received signal
    received_data = lora_demodulate(noisy_data, SF, BW, CR);

    % Compare transmitted and received data
    bit_errors = sum(data ~= received_data);
    total_bit_errors = total_bit_errors + bit_errors;
end

% Calculate average Bit Error Rate (BER) over all simulations
BER = total_bit_errors / (num_simulations * length(data));
disp(['Average Bit Error Rate (BER) over ' num2str(num_simulations) ' simulations: ' num2str(BER)]);
function modulated_data = lora_modulate(data, SF, BW, CR)
    % Perform LoRa modulation
    chirps_per_bit = 2^SF; % Number of chirps per bit
    modulated_data = zeros(1, length(data)*chirps_per_bit);
    
    for i = 1:length(data)
        if data(i) == 0
            symbol = -1;
        else
            symbol = 1;
        end
        
        % Modulate using chirp spread spectrum
        chirp = exp(1j*2*pi*symbol*linspace(0, 1, chirps_per_bit));
        
        % Add chirp to modulated data
        modulated_data((i-1)*chirps_per_bit+1:i*chirps_per_bit) = chirp;
    end
end


function received_data = lora_demodulate(noisy_data, SF, BW, CR)
    % Perform LoRa demodulation
    chirps_per_bit = 2^SF; % Number of chirps per bit
    received_data = zeros(1, length(noisy_data)/chirps_per_bit);
    
    for i = 1:length(received_data)
        chirp = noisy_data((i-1)*chirps_per_bit+1:i*chirps_per_bit);
        
        % Demodulate using correlation with known chirp
        symbol = sum(chirp .* conj(exp(1j*2*pi*linspace(0, 1, chirps_per_bit)))) / chirps_per_bit;
        
        % Determine bit value based on symbol
        if real(symbol) < 0
            received_data(i) = 0;
        else
            received_data(i) = 1;
        end
    end
end
