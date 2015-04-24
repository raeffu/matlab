%% Task 5
% a)
%clear;
load('train', 'y');
whos;
sound(y)
% b)
subplot(2,2,1)
plot(y)
n=1501:1700;
subplot(2,2,2)
plot(n, y(n), '.-')
% c)
sound(y(1:2:end))
% d)
z = y' .* cos(2*pi*1000*(1:length(y))/8192);
sound(z)
% e)
subplot(2,2,3)
plot(z)
n=1501:1700;
subplot(2,2,4)
plot(n, z(n), '.-')
suptitle('Abbildung 2 von hanis1 und laubr2')

%print -dpng abbildung2_hanis1_laubr2.png