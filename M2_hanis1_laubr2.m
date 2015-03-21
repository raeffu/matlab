function [] = M2_hanis1_laubr2()
%M2 This function solves problems 1, 3, 7 and 8
%   Serie M2, hanis1 (Sebastian Haeni), laubr2 (Raphael Laubscher)

    clc;                         % Clear console
    currentTask = 4;             % Current selected task
    f = figure('Visible','off'); % Create a figure
    drawUi();                    % Draw control to select tasks
    f.Visible = 'on';            % Make figure visble
    f.SizeChangedFcn = @(src, ev) drawUi(); % Redraw function

    % Create pop-up menu
    function drawUi()
        clf;
        fPos = f.Position;
        uicontrol('Style', 'text',...
            'Position', [0 0 fPos(3) 30],...
            'String', '(c) 2015 Sebastian Haeni, Raphael Laubscher',...
            'FontSize', 10);
        c = uicontrol('Style', 'popup',...
            'String', {'Aufgabe 1', 'Aufgabe 3', 'Aufgabe 7',...
                'Aufgabe 8'},...
            'Position', [5 fPos(4)-50 100 50],...
            'Callback', @(src, event)setTask(src.Value));
        c.Value = currentTask;

        switch currentTask
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

    function setTask(value)
        currentTask = value;
        drawUi();
    end

    function task1()
        % TODO
        uicontrol('Style', 'text',...
            'Position', [220 200 120 20],...
            'String', 'not yet implemented');
    end

    function task3()
        % TODO
        uicontrol('Style', 'text',...
            'Position', [220 200 120 20],...
            'String', 'not yet implemented');
    end

    function task7()
        sn = @(x) -3*(x^4) + 10 * (x^2) - 3;

        subplot(2, 1, 1);
        fplot(sn, [-4, 3]);
        title('-4 \leq x \leq 3');

        subplot(2, 1, 2);
        fplot(sn, [-2, 4]);
        title('-2 \leq x \leq 4');
    end

    function task8()
        sitzeProPartei = [54, 46, 30, 28, 15, 12, 9, 2, 2, 1, 1];
        parteien = {'SVP', 'SP', 'FDP', 'CVP', 'GPS', 'glp',...
            'BDP', 'EVP', 'Lega', 'CSP OW', 'MCG'};
        sitzeProKanton = [34, 26, 18, 15, 12, 11, 10, 8, 7, 7, 7, 7, 6,...
            5, 5, 5, 4, 3, 2, 2, 1, 1, 1, 1, 1, 1];
        kantone = {'Zuerich', 'Bern', 'Waadt', 'Aargau', 'St. Gallen',...
            'Genf', 'Luzern', 'Tessin', 'Solothurn',...
            'Basel-Landschaft', 'Wallis', 'Freiburg', 'Thurgau',...
            'Basel-Stadt', 'Graubuenden', 'Neuenburg', 'Schwyz', 'Zug',...
            'Schaffhausen', 'Jura', 'Uri', 'Obwalden', 'Nidwalden',...
            'Glarus', 'Appenzell Ausserrhoden', 'Appenzell Innerrhoden'};

        subplot(1, 2, 1);
        pie(sitzeProPartei, parteien);
        title('Nationalraete pro Partei');

        subplot(1, 2, 2);
        pie(sitzeProKanton, kantone); % TODO choose more sensible chart
        title('Nationalraete pro Kanton');
    end

end
