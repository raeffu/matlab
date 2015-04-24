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
        % a)
        subplot(2, 2, 1)
        t=[0:10];
        x=3*cos(t)+4*sin(t);
        plot(t,x,'.-')
        % b)
        subplot(2, 2, 2)
        t=[0:0.1:10];
        x=3*cos(t)+4*sin(t);
        plot(t,x,'.-')
        % c)
        n=[1:4000];
        x=cos(2*pi*440*n/8192);
        sound(x)
        % d)
        subplot(2,2,3)
        plot(x)
        % e)
        x(1:8)
        % f)
        subplot(2,2,4)
        plot(x(1:100))
        % g)
        sound(x(1:2:end))
        % h)
        suptitle('Abbildung 1 von hanis1 und laubr2')
        %print -dpng abbildung1_hanis1_laubr2.png
    end

    %% Task 5
    function task5()
        % a)
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
    end

    %% Task 6
    function task6()
        
    end

end
