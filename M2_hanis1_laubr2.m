function [] = M2_hanis1_laubr2()
    clc;                         % Clear console
    f = figure('Visible','off'); % Create a figure
    drawUi(1, 'Aufgabe 1');      % Draw control to select tasks
    f.Visible = 'on';            % Make figure visble
    task1();                     % Draw task 1
    
    % Switching task
    function setTask(source, callbackdata)
        value = source.Value;
        title = source.String(value);
        clf; % clear figure
        drawUi(value, title);
        switch value
            case 1
                task1();
            case 2
                task3();
            case 3
                task7();
            case 4
                task8();
        end
    end

    % Create pop-up menu
    function drawUi(selected, title)
        fPos = f.Position;
        uicontrol('Style', 'text',...
            'Position', [0 fPos(4)-50 fPos(3) 50],...
            'String', title,...
            'FontSize', 20);
        uicontrol('Style', 'text',...
            'Position', [0 0 fPos(3) 30],...
            'String', '(c) 2015 Sebastian Häni, Raphael Laubscher',...
            'FontSize', 10);
        c = uicontrol('Style', 'popup',...
           'String', {'Aufgabe 1', 'Aufgabe 3', 'Aufgabe 7', 'Aufgabe 8'},...
           'Position', [20 320 100 50],...
           'Callback', @setTask);
        c.Value = selected;
    end

    function task1
        uicontrol('Style', 'text',...
            'Position', [220 200 120 20],...
            'String', 'not yet implemented');
    end

    function task3
        uicontrol('Style', 'text',...
            'Position', [220 200 120 20],...
            'String', 'not yet implemented');
    end

    function task7
        uicontrol('Style', 'text',...
            'Position', [220 200 120 20],...
            'String', 'not yet implemented');
    end

    function task8
        uicontrol('Style', 'text',...
            'Position', [220 200 120 20],...
            'String', 'not yet implemented');
    end

end
