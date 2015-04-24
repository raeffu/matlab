function [] = M3_hanis1_laubr2()
%   Serie M3, hanis1 (Sebastian Haeni), laubr2 (Raphael Laubscher)
%   The different solutions will be accessible in one figure. Just select
%   the task # in the drop down in the upper left.

    %% Initialization

    clc;                         % Clear console
    currentTask = 1;             % Current selected task
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
            'String', {'Aufgabe 1', 'Aufgabe 4', 'Aufgabe 5',...
                'Aufgabe 6'},...
            'Position', [5 fPos(4)-50 100 50],...
            'Callback', @(src, event) setTask(src.Value));
        c.Value = currentTask;

        switch currentTask
            case 1
                task1();
            case 2
                task4();
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

    %% Task 1
    function task1()
        A = 2;
        fre = 5;
        tau = -pi/5;
        signal = @(t) A*cos(2*pi*fre*t + tau);
        fplot(signal, [0, 0.16])
    end

    %% Task 4
    function task4()
        subplot(221)
        % a)
        t=[0:10];
        x=3*cos(t)+4*sin(t);
        plot(t,x,'.-')
    end

    %% Task 5
    function task5()
        
    end

    %% Task 6
    function task6()
        
    end

end
