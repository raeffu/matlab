function [] = M4_task6_hanis1_laubr2()
%   Serie M4, hanis1 (Sebastian Haeni), laubr2 (Raphael Laubscher)
    tact = 1/4;
    melody = [
        350,2
        200,2
        700,2
        350,1
        200,1
        500,2
        0  ,4 % break
        350,2
        300,2
        700,2
        100,1
        350,1
    ];
    playMelody(melody);
    
    %% Play melody
    function playMelody(melody)
        for i = 1:length(melody)
            bell(melody(i, 1)-100, melody(i, 1), 3, 2, melody(1, 2));
        end
    end
    
    %% Play bell sound
    function bell(fc, fm, I0, tau, dur)
        if fc > 0
            [Aenv, Ienv] = bellenv(1, I0, tau, dur * tact, 11025);
            cc = synth(fc, fm, Aenv, Ienv, dur * tact, 11025);

            sound(cc, 11025);
        end
        pause(dur * tact);
    end

    %% Bell sound
    function [Aenv, Ienv] = bellenv(A0, I0, tau, dur, fs)
        tt = 0:1 / fs:dur -1 / fs;
        Aenv = A0 * exp(-tt / tau);
        Ienv = I0 * exp(-tt / tau);
    end

    %% Synthesize
    function cc = synth(fc, fm, Aenv, Ienv, dur, fs)
        tt = 0:1/fs:dur-1/fs;
        if (length(tt) < length(Ienv))
            for i = length(tt) + 1:length(Ienv)
                tt(i) = tt(i - 1) + 1 / fs;
            end
        elseif (length(tt) > length(Ienv))
            tt = tt(1:length(Ienv));
        end
        cc = Aenv .* cos(2*pi*fc.*tt + Ienv .* cos(2*pi*fm.*tt-(pi/2)) - pi/2);
    end

end
