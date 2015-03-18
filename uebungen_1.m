%% Physik - Matlab-Uebungen 1
% Autor: Raphael Laubscher
% Klasse: I2p

clc;clear;
%% 1a)
a1 = (22+5.1^2)/(50-6.3^2)
%% b)
b1 = 21/15 + 8^3/5 - 119/2.9^2
%% c)
c1 = nthroot(123, 3) + log(600)/4
%% d)
d1 = cos((7*pi)/9) + tan(((7*pi)/15)*pi) * sind(15)

%% 2a)
x = 5.2;
y = 3.6;

a2 = (5/4)*x*y - (8*x)/y^2 + sqrt(x*y)
%% b)
b2 = 4*(x*y)^2 - (x+y)/((2*x-y)^2) + sqrt((x+y)/(2*x-y))

%% 3a)

%% ...

%% * 9)
aa = [zeros(1,5) 4.8] % Zeilenvektor
%aa2=[zeros(5,1); 4.8] % Spaltenvektor

%% * 11)
AA = [130:-20:10;linspace(1,12,7);linspace(12,72,7)]

%% * 12)
%BB(:,1) = linspace(5,5,4)
%BB(:,2) = linspace(2,2,4)
%BB(:,3) = linspace(3,3,4)
BB = [linspace(5,5,4);linspace(2,2,4);linspace(3,3,4)]'

%% * 15)
DD = ones(3,2)
AA2 = [DD zeros(3,2);zeros(3,2) DD]
