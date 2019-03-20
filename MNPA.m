close all
clear 

R1 = 1;
G1 = 1/R1;
c = 0.25;
R2 = 2;
G2 = 1/R2;
L = 0.2;
R3 = 10;
G3 = 1/R3;
a = 100;
R4 = 0.1;
G4 = 1/R4;
Ro = 1000;
Go = 1/Ro;

C = [0 0 0 0 0 0 0
    -c c 0 0 0 0 0
    0 0 -L 0 0 0 0
    0 0 0 0 0 0 0
    0 0 0 0 0 0 0
    0 0 0 0 0 0 0
    0 0 0 0 0 0 0];

G = [1 0 0 0 0 0 0
    -G2 G1+G2 -1 0 0 0 0
    0 1 0 -1 0 0 0
    0 0 -1 G3 0 0 0
    0 0 0 0 -a 1 0
    0 0 0 G3 -1 0 0
    0 0 0 0 0 -G4 G4+Go];

Vdc = zeros(7,1);      
Vac = zeros(7,1);      
b = zeros(7,1);

steps = 50;
Vin = linspace(-10,10, 50);
for n=1:steps
    b(1) = Vin(n);
    X = G\b;
    V3(n) = X(4);
    VO(n) = X(7);
    gain(n) = VO(n)/Vin(n);
end
figure(1);
plot(Vin,V3, Vin, VO);

F = logspace(1, 2, 500);
OutputNode = 7;   
b(1) = 1;
for n=1:length(F)
    w = 2*pi*F(n);
    s = 1i*F(n);
    A = G + s*C;   

    X = A\b;
    Vout(n) = abs(X(OutputNode));
    gain(n) = 20*log(abs(X(OutputNode))/b(1));
end

figure(2);
semilogx(F, Vout);
figure(3);
plot(F, gain);

cs =  0.25 + 0.05.*randn(1,1000);
VOg = zeros(1000,1);
for m = 1:length(VOg)
    c = cs(m);
    C(2,1) = -c;
    C(2,2) = c;
    Vac = (G+C*1j*pi)\b;                
    VOg(m,1) = abs(Vac(7,1))/F(1);    
end
figure(4);
hist(VOg,50);