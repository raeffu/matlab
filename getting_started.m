clc;clear;
x=3; % Kommentar
y=2;
z=4;

% Zeile mit Semikolon ; wird nicht ausgegeben

x*y*z

% Vektoren & Matrizen
jahre=[2008 2009 2010 2011]
studenten=[10 33 24 58]
v = [-5:6] % Range angeben -5 : 6 (-5 bis 6)
w = [2008:-2:2001] % Increment Decrement in Range
u = linspace(0,8,6) % gleiche Abstände
r = linspace(0,length(studenten), 5)

m = [1 2 3; 4 5 6; 7 8 9]
m1 = zeros(3,4)
m2 = ones(3,4)
m3 = eye(5)
val1 = m(2,3)
m(2,3) = 10
row1 = m(:,2)
col1 = m(2,:)
size(m)

A(1:2,:)=zeros(2,5)
A(3:4,:)=ones(2,5)
B=[zeros(2,5);ones(2,5)]