clear all, clc
audioobjekt = audiorecorder(8000, 8, 1);
recordblocking(audioobjekt, 5)
x = getaudiodata(audioobjekt);
plot([1:numel(x)]/8000, x)
xlabel 't [s] ', ylabel 'x(t) '
grid; zoom xon
sound(x)
% doc fft