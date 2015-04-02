function [] = Uebungen_Serie_2()

% Aufgabe 3 e)
A = 1.2;
w = 1/2;
p = pi/6;

y = @(t) A * cos(w * t + p);
vy = @(t) A * -sin(w * t + p) * w;
ay = @(t) A * -cos(w * t + p) * w^2;

subplot(3, 1, 1);
fplot(y, [0, 100]);
subplot(3, 1, 2);
fplot(vy, [0, 100]);
subplot(3, 1, 3);
fplot(ay, [0, 100]);

end