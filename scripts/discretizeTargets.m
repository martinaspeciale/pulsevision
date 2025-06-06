%% 
clc;
clear;
close all;


%% Load images and targets
type = 'Polso';
data_path = strcat('../dataset/imgs/', type);
dirs = dir(data_path);

targets = readtable('../dataset/targets.csv', 'PreserveVariableNames', true);

if ~exist(strcat('../dataset/classes/', type, '/sys/low'), 'dir')
    mkdir(strcat('../dataset/classes/', type, '/sys/low'))
    mkdir(strcat('../dataset/classes/', type, '/sys/normal'))
    mkdir(strcat('../dataset/classes/', type, '/sys/high'))
end

if ~exist(strcat('../dataset/classes/', type, '/dia/low'), 'dir')
    mkdir(strcat('../dataset/classes/', type, '/dia/low'))
    mkdir(strcat('../dataset/classes/', type, '/dia/normal'))
    mkdir(strcat('../dataset/classes/', type, '/dia/high'))
end


for i = 1 : 245

    img = imread(strcat('../dataset/imgs/', type, '/', num2str(i), '.jpg'));

    sys = targets{i, 1};
    dia = targets{i, 2};
    
    if sys < 90
        sys_disc = 'low';
    elseif sys >= 90 && sys <= 120
        sys_disc = 'normal';
    elseif sys > 120
        sys_disc = 'high';
    end

    path = strcat('../dataset/classes/', type, '/sys/', sys_disc, '/', num2str(i), '.jpg');
    imwrite(img, path);

    if dia < 60
        dia_disc = 'low';
    elseif sys >= 60 && sys <= 90
        dia_disc = 'normal';
    elseif sys > 90
        dia_disc = 'high';
    end

    path = strcat('../dataset/classes/', type, '/dia/', dia_disc, '/', num2str(i), '.jpg');
    imwrite(img, path);
end