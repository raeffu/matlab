function [] = M4_hanis1_laubr2()
%   Serie M4, hanis1 (Sebastian Haeni), laubr2 (Raphael Laubscher)
%   The different solutions will be accessible in one figure. Just select
%   the task # in the drop down in the upper left.

    %% Initialization

    clc;                         % Clear console
    currentTask = 2;             % Current selected task
    f = figure('Visible','off'); % Create a figure
    f.SizeChangedFcn = @(src, ev) drawUi(); % Redraw function
    f.Visible = 'on';            % Make figure visible
    
    %% General functions
    
    % Draw UI
    function drawUi()
        clf;
        fPos = f.Position;
        uicontrol('Style', 'text',...
            'Position', [0 0 fPos(3) 30],...
            'String', '(c) 2015 Sebastian Haeni, Raphael Laubscher',...
            'FontSize', 10);
        c = uicontrol('Style', 'popup',...
            'String', {'Aufgabe 2', 'Aufgabe 3', 'Aufgabe 5',...
                'Aufgabe 6'},...
            'Position', [5 fPos(4)-50 100 50],...
            'Callback', @(src, event) setTask(src.Value));
        c.Value = currentTask;

        switch currentTask
            case 1
                task2();
            case 2
                task3();
            case 3
                task5();
            case 4
                task6();
        end
    end

    % Change current task and update UI
    function setTask(value)
        currentTask = value;
        drawUi();
    end

    %% Task 2
    function task2()
        fs = 11025;
        cc = synth(110, 220, 20, 10, 1, fs);
        %sound(cc, fs);
        
        fu = ((0:length(cc)-1) / length(cc))*fs;
        s = abs(fft(cc, length(cc)));
        s = 20*log10(s);
        plot(fu, s)
        xlabel('Frequenz (Hz )'); ylabel('Amplitude (dB)');
    end

    %% Function 1
    function cc = synth(fc, fm, Aenv, Ienv, dur, fs)
        tt = [0:1/fs:dur-1/fs];
        if (length(tt)<length(Ienv))
            for i=length(tt)+1:length(Ienv)
                tt(i) = tt(i-1)+1/fs;
            end
        elseif (length(tt)>length(Ienv))
            tt=tt(1:length(Ienv));
        end
        cc = Aenv .* cos(2*pi*fc.*tt + Ienv .* cos(2*pi*fm.*tt-(pi/2)) - pi/2);
    end

    %% Function 2
    function [Aenv, Ienv] = bellenv(A0, I0, tau, dur, fs)
        tt = [0:1/fs:dur-1/fs];
        Aenv = A0*exp(-tt/tau);
        Ienv = I0*exp(-tt/tau);
    end

    %% Task 3
    function task3()
        fs = 11025;
        dur = 1;
        A0 = 1;
        I0 = 10;
        tau = 2;
        
        [Aenv, Ienv] = bellenv(A0, I0, tau, dur, fs);
        subplot(2, 1, 1)
        plot(Aenv)
        subplot(2,1,2)
        plot(Ienv)
    end

    %% Task 5
    function task5()
        
    end

end
