function [] = M2_hanis1_laubr2()
%   Serie M3, hanis1 (Sebastian Haeni), laubr2 (Raphael Laubscher)

    clc;                         % Clear console
    A = 2;
    f = 5;
    tau = -pi/5;
    signal = @(t) A*cos(2*pi*f*t + tau);
    fplot(signal, [0, 0.16])
end
