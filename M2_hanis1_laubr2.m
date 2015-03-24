function [] = M2_hanis1_laubr2()
%   Serie M2, hanis1 (Sebastian Haeni), laubr2 (Raphael Laubscher)

    clc;                         % Clear console
    currentTask = 1;             % Current selected task
    f = figure('Visible','off'); % Create a figure
    f.SizeChangedFcn = @(src, ev) drawUi(); % Redraw function
    f.Visible = 'on';            % Make figure visble

    % Draw UI
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
            'Callback', @(src, event) setTask(src.Value));
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

    % Setting current task and update UI
    function setTask(value)
        currentTask = value;
        drawUi();
    end

    function task1()
        count = 0;
        for i = -3:3
            count = count + 1;
            A(count) = i^2-exp(0.5*i)+i;
        end
        uicontrol('Style', 'text',...
            'Position', [0 -100 f.Position(3) f.Position(4)],...
            'String', A);
    end

    function task3()
        count = 0;
        values = [1.5:1:5.5 6.6];
        for i = values
            count = count + 1;
            B(count) = ((i+3)^4)/((i+1)*sqrt(i));
        end
        uicontrol('Style', 'text',...
            'Position', [0 -100 f.Position(3) f.Position(4)],...
            'String', B);
    end

    function task7()
        sn = @(x) -3*(x^4) + 10 * (x^2) - 3;

        subplot(2, 1, 1);
        fplot(sn, [-4, 3]);
        title('-4 \leq x \leq 3');

        subplot(2, 1, 2);
        fplot(sn, [-2, 4]);
        title('-2 \leq x \leq 4');
        
        % setting axis is not necessary as fplot does what we want
        % automagically
    end

    function task8()
        subplot(1, 2, 1);
        task8a();
        subplot(1, 2, 2);
        task8b();
    end

    function task8a()
        % data declaration
        sitzeProPartei = [54, 46, 30, 28, 15, 12, 9, 2, 2, 1, 1];
        parteien = {'SVP', 'SP', 'FDP', 'CVP', 'GPS', 'glp',...
            'BDP', 'EVP', 'Lega', 'CSP OW', 'MCG'};
        
        % drawing pie chart
        pie(sitzeProPartei, parteien);
        title('Nationalraete pro Partei');
    end

    function task8b()
        % data declaration
        sitzeProKanton = [34, 26, 18, 15, 12, 11, 10, 8, 7, 7, 7, 7, 6,...
            5, 5, 5, 4, 3, 2, 2, 1, 1, 1, 1, 1, 1];
        kantone = {'Zuerich', 'Bern', 'Waadt', 'Aargau', 'St. Gallen',...
            'Genf', 'Luzern', 'Tessin', 'Solothurn',...
            'Basel-Landschaft', 'Wallis', 'Freiburg', 'Thurgau',...
            'Basel-Stadt', 'Graubuenden', 'Neuenburg', 'Schwyz', 'Zug',...
            'Schaffhausen', 'Jura', 'Uri', 'Obwalden', 'Nidwalden',...
            'Glarus', 'Appenzell Ausserrhoden', 'Appenzell Innerrhoden'};
       
        % drawing bar chart
        h = bar(sitzeProKanton);
        title('Nationalraete pro Kanton');
        set(gca, 'XTickLabel', {}); % clearing X labels
        
        % drawing labels directly on bars
        for i = 1:length(kantone)
            xData = h.XData;
            yData = h.YData;
            text(xData(i), yData(i) + .1, kantone(i),...
                'Color', 'k',...
                'HorizontalAlignment', 'left',...
                'Rotation', 90);
        end
        
        % fit the graph nicely
        ylim([0 40]);
        xlim([0 27]);
    end

end
