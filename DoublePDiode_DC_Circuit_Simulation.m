close all;
clc;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

q0 = 1.60218 * 10 ^ (- 19); % Charge of electron in C
m1 = 4.1; % Constant for first semiconductor
m2 = 4; % Constant for second semiconductor
kB = 1.38065 * 10 ^ (- 23); % Boltzmann const. in m^2 Kg s^-2 K^-1
TK = 300; % Temp. in K
is1 = 5 * 10 ^ (- 13); % Assumed dark current of diode 1
is2 = 10 ^ (- 12); % Assumed dark current of diode 2
vt = kB * TK / q0;
%vs = 10; % Voltage of source in Volts

fs = 2000; % Amount of data
y0 = zeros(1, fs); % Vector for currents for diodes in parallel
y1 = zeros(1, fs); % Vector for currents for diode 1 that work with KCL
y2 = zeros(1, fs); % Vector for currents for diode 2 that work with KCL
vs = zeros(1, fs); % Voltages for source
vK = 10; % Voltage constant
%Tt = 1; % Time constant in seconds
%t = zeros(1, fs); % Vector for time marks

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1 : fs
    vs(1, i) = i * vK / fs;
    y1(1, i) = is1 * (exp(vs(1, i) / (vt * m1)) - 1);
    y2(1, i) = is2 * (exp(vs(1, i) / (vt * m2)) - 1);
    y0(1, i) = y1(1, i) + y2(1, i);
    %t(1, i) = Tt * i / fs; % Times acording to a constant Tt
    %vs(1, i) = 10 * sin(2 * pi * freq * t(1, i)); % Sine-voltage function
    %x = @(vd) vs - r1 * is * (exp(vd / vt) - 1) - vd; % Sum of all voltages
    %y(1, i) = fzero(x, 0); % Diode voltages that work with KVL
end

plot(vs, y1, vs, y2, vs, y0) % Graph. We want it to adjust itself
axis([2, 3, 0, 1])
xlabel('Voltage')
ylabel('Current')
title('\bf Two diode parallel circuit')