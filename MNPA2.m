clc; close all;  clear all;  %initialization of the matlab environment

global G C b; %define global variables

G = zeros(6,6); 
C = zeros(6,6); 
b = zeros(6,1); 

vol(1,0,1);
res(1,2,1);
cap(1,2,0.25);
res(2,0,2);
ind(2,3,0.2);
ccvs(4,0,6,0,100);
res(3,6,10);
res(4,5,0.1);
res(5,0,1000);
%% Part B - DC Sweep
steps = 50;
Vin = linspace(-10,10, 50);
for n=1:steps
    b(6) = Vin(n);
    X = G\b;
    V3(n) = X(3);
    VO(n) = X(5);
    gain(n) = VO(n)/Vin(n);
end
figure(1);
plot(Vin,V3, Vin, VO);
%% Part C - Frequency Response
fmin = 0;
fmax = 1e9;
Nrpt = 1e6;  %Number of frequency points
F = linspace(fmin, fmax, Nrpt);
OutputNode = 5;   

for n=1:Nrpt
    w = 2*pi*F(n);
    s = 1i*w;
    A = G + s*C;   

    X = A\b;
    Vout(n) = abs(X(OutputNode));
    VoutDB(n) = 20*log10(abs(X(OutputNode)));
end

figure(2);
plot(Vout,F);
figure(3);
semilogx(F, VoutDB);
%% Part D - Monte Carlo
Cvals = normrnd(0.2,0.05,1,20);
for n = 1:20
    s = 1i*pi;
    C(1,1) = Cvals(n);
    C(2,2) = Cvals(n);
    C(1,2) = Cvals(n)*-1;
    C(2,1) = Cvals(n)*-1;
    
    A = G + s*C;   
    X = A\b;
    gainMC(n) = 20*log10(abs(X(OutputNode)));
end
figure(4)
histogram(gainMC);
