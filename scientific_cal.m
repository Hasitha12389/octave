function scientific_cal()

   %define and styled new figure of calculator
    calcFig = figure('Name', 'Octave Scientific Calculator', 'NumberTitle', 'off', ...
                     'Position', [500, 100, 340, 670], 'MenuBar', 'none', ...
                     'Resize', 'on', 'Color', [0.97, 0.97, 0.97]);

    % define and styled calculator display part
    displayField = uicontrol('Style', 'edit', 'String', '', ...
                             'Position', [30, 600, 290, 60], ...
                             'FontSize', 16, 'HorizontalAlignment', 'right', ...
                             'BackgroundColor', [1, 0.85, 0.85], ...
                             'ForegroundColor', [0, 0, 0]);

     %labels for the buttons
    buttonLabels = {'x^y','x^1/y','x^1/2','x^1/3', ...
                    '1/x', 'e', 'x^2', 'x^3', ...
                    'secd','cosecd','cotd','!', ...
                    'sind','cosd','tand','pi', ...
                    '(', ')', '⌫', 'C', ...
                    '7', '8', '9', '/', ...
                    '4', '5', '6', '*', ...
                    '1', '2', '3', '-', ...
                    '.', '0', '=', '+'};


    % grid for parameters
    buttonWidth = 60;
    buttonHeight = 50;
    horizontalPadding = 17;
    verticalPadding = 17;
    startX = 30;
    startY = 540;
    columns = 4;

    for i = 1:length(buttonLabels)
        rowIndex = floor((i-1) / columns);
        colIndex = mod((i-1), columns);

        buttonX = startX + colIndex * (buttonWidth + horizontalPadding);
        buttonY = startY - rowIndex * (buttonHeight + verticalPadding);

        if strcmp(buttonLabels{i}, '⌫')
            buttonBgColor = [1, 0, 0];  % Red background for '⌫'
            buttonTextColor = [1, 1, 1];
        elseif strcmp(buttonLabels{i}, 'C')
            buttonBgColor = [0.4, 0.8, 0.4];   % Green background for 'C'
            buttonTextColor = [1, 1, 1];
        elseif strcmp(buttonLabels{i}, '=')
            buttonBgColor = [0.4, 0.8, 0.4];
            buttonTextColor = [1, 1, 1];    % white color for fonts
        elseif any(strcmp(buttonLabels{i}, {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'}))
            buttonBgColor = [0.6, 0.6, 0.6];
            buttonTextColor = [1, 1, 1];
        else
            buttonBgColor = [0.9, 1, 0.9];     % Light gray background for others
            buttonTextColor = [0.2, 0.2, 0.2];   % White color for fonts
        end

        uicontrol('Style', 'pushbutton', 'String', buttonLabels{i}, ...
                  'Position', [buttonX, buttonY, buttonWidth, buttonHeight], ...
                  'FontSize', 14, 'Callback', @(btn, ~) handleButtonPress(btn, displayField), ...
                  'BackgroundColor', buttonBgColor, 'ForegroundColor', buttonTextColor);
    end
end

function handleButtonPress(button, displayField)
    buttonText = get(button, 'String');
    currentDisplay = get(displayField, 'String');

    switch buttonText
        case 'C'
            set(displayField, 'String', '');
        case '⌫'
            if ~isempty(currentDisplay)
                set(displayField, 'String', currentDisplay(1:end-1));
            end
        case '='
            try
                expression = strrep(currentDisplay, 'pi', num2str(pi));
                result = eval(expression);
                set(displayField, 'String', num2str(result));
            catch
                set(displayField, 'String', 'Error');
            end
        case '.'
            if isempty(currentDisplay)
                set(displayField, 'String', '0.');
            else
                set(displayField, 'String', [currentDisplay buttonText]);
            end
        case 'secd'
            if isempty(currentDisplay) || currentDisplay(end) == '('
                set(displayField, 'String', [currentDisplay 'sec(']);
            else
                try
                    value = str2double(currentDisplay);
                    result = 1 / cosd(value);
                    set(displayField, 'String', num2str(result));
                catch
                    set(displayField, 'String', 'Error');
                end
            end
        case 'cosecd'
            if isempty(currentDisplay) || currentDisplay(end) == '('
                set(displayField, 'String', [currentDisplay 'cosec(']);
            else
                try
                    value = str2double(currentDisplay);
                    result = 1 / sind(value);
                    set(displayField, 'String', num2str(result));
                catch
                    set(displayField, 'String', 'Error');
                end
            end
        case 'cotd'
            if isempty(currentDisplay) || currentDisplay(end) == '('
                set(displayField, 'String', [currentDisplay 'cot(']);
            else
                try
                    value = str2double(currentDisplay);
                    result = 1 / tand(value);
                    set(displayField, 'String', num2str(result));
                catch
                    set(displayField, 'String', 'Error');
                end
            end
        case 'sind'
            if isempty(currentDisplay) || currentDisplay(end) == '('
                set(displayField, 'String', [currentDisplay 'sin(']);
            else
                try
                    value = str2double(currentDisplay);
                    result = sind(value);
                    set(displayField, 'String', num2str(result));
                catch
                    set(displayField, 'String', 'Error');
                end
            end
        case 'cosd'
            if isempty(currentDisplay) || currentDisplay(end) == '('
                set(displayField, 'String', [currentDisplay 'cos(']);
            else
                try
                    value = str2double(currentDisplay);
                    result = cosd(value);
                    set(displayField, 'String', num2str(result));
                catch
                    set(displayField, 'String', 'Error');
                end
            end
        case 'tand'
            if isempty(currentDisplay) || currentDisplay(end) == '('
                set(displayField, 'String', [currentDisplay 'tan(']);
            else
                try
                    value = str2double(currentDisplay);
                    result = tand(value);
                    set(displayField, 'String', num2str(result));
                catch
                    set(displayField, 'String', 'Error');
                end
            end
        case '!'
            try
                value = str2double(currentDisplay);
                if value == floor(value) && value >= 0
                    result = factorial(value);
                    set(displayField, 'String', num2str(result));
                else
                    set(displayField, 'String', 'Error');
                end
            catch
                set(displayField, 'String', 'Error');
            end
        case '1/x'
            try
                if isempty(currentDisplay)
                    set(displayField, 'String', '1/');
                else
                    set(displayField, 'String', [currentDisplay '1/']);
                end
            catch
                set(displayField, 'String', 'Error');
            end
        case 'e'
            try
                value = str2double(currentDisplay);
                result = exp(value);
                set(displayField, 'String', num2str(result));
            catch
                set(displayField, 'String', 'Error');
            end
        case 'x^1/2'
            try
                if isempty(currentDisplay)
                    set(displayField, 'String', 'Error');
                else
                    set(displayField, 'String', [currentDisplay '^(1/2)']);
                end
            catch
                set(displayField, 'String', 'Error');
            end
        case 'x^1/3'
            try
                if isempty(currentDisplay)
                    set(displayField, 'String', 'Error');
                else
                    set(displayField, 'String', [currentDisplay '^(1/3)']);
                end
            catch
                set(displayField, 'String', 'Error');
            end
        case 'x^1/y'
            if isempty(currentDisplay) || currentDisplay(end) == '('
                set(displayField, 'String', [currentDisplay '']);
            else
                set(displayField, 'String', [currentDisplay '^(1/']);
            end
        case 'x^2'
            try
                if isempty(currentDisplay)
                    set(displayField, 'String', 'Error');
                else
                    set(displayField, 'String', [currentDisplay '^2']);
                end
            catch
                set(displayField, 'String', 'Error');
            end
        case 'x^3'
            try
                if isempty(currentDisplay)
                    set(displayField, 'String', 'Error');
                else
                    set(displayField, 'String', [currentDisplay '^3']);
                end
            catch
                set(displayField, 'String', 'Error');
            end
        case 'x^y'
            if isempty(currentDisplay) || currentDisplay(end) == '('
                set(displayField, 'String', [currentDisplay '']);
            else
                set(displayField, 'String', [currentDisplay '^']);
            end
        otherwise
            set(displayField, 'String', [currentDisplay buttonText]);
    end
end

scientific_cal()


