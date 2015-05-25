function [] = M4_task6_hanis1_laubr2()
%   Serie M4, hanis1 (Sebastian Haeni), laubr2 (Raphael Laubscher)
    tact = 1/4;
    frequency = 11025;
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
    audio = createMelody(melody);
    audiowrite('task6.wav', audio, frequency);
    sound(audio, frequency);
    
    %% Play melody
    function audio = createMelody(melody)
        audio = [];
        for i = 1:length(melody)
            bell = bell(melody(i, 1)-100, melody(i, 1), 3, 2, melody(1, 2));
            audio = cat(2, audio, bell);
        end
    end
    
    %% Play bell sound
    function bell = bell(fc, fm, I0, tau, dur)
        if fc > 0
            [Aenv, Ienv] = bellenv(1, I0, tau, dur * tact, frequency);
            bell = synth(fc, fm, Aenv, Ienv, dur * tact, frequency);
        else
           % add break 
           bell = zeros(1, round(dur * tact * frequency));
        end
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
