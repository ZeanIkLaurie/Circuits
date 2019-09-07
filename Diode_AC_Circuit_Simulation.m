close all;
clc;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

q0 = 1.60218 * 10 ^ (- 19); % Charge of electron in C
n0 = 1; % For this semiconductor
kB = 1.38065 * 10 ^ (- 23); % Boltzmann const. in m^2 Kg s^-2 K^-1
TK = 300; % Temp. in K
is = 10 ^ (- 13); % Assumed dark current of diode
vt = kB * TK / q0; 

r1 = 10 * 10 ^ 3; % Resistance of the resistor in Ohms

freq = 5; % Frecuency of waves
fs = 2000; % Amount of data
Tt = 1; % Total time in seconds
t = zeros(1, fs); % Vector for time marks
y = zeros(1, fs); % Vector for voltages that work with KVL
vs = zeros(1, fs); % Vector for source voltages

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1 : fs
    t(1, i) = Tt * i / fs; % Times acording to a constant Tt
    vs(1, i) = 10 * sin(2 * pi * freq * t(1, i)); % Sine-voltage function
    x = @(vd) vs(1, i) - r1 * is * (exp(vd / vt) - 1) - vd; % Sum of all voltages
    y(1, i) = fzero(x, 0); % Diode voltages that work with KVL
end

plot(t, vs, t, y) % Graph. We want it to adjust itself
% axis([0, 2, 0, 2])
xlabel('time in sec')
ylabel('Voltages source vs diode')
title('\bf Diode rectifier')