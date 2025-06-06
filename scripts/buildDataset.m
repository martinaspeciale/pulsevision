%% Build dataset
clc;
clear;
close all;


data_path = '../data';
dirs = dir(data_path);

if ~exist('../dataset', 'dir')
    mkdir('../dataset')
end


%% 
targets = [];
counter = 1;

for i = 3 : numel(dirs)
    dirs_1 = dir(strcat(data_path, '/', dirs(i).name));

    for j = 3 : numel(dirs_1)
        dirs_2 = dir(strcat(data_path, '/', dirs(i).name, '/', dirs_1(j).name));

        for k = 3 : numel(dirs_2)
            targets_path = dir(strcat(data_path, '/', dirs(i).name, '/', dirs_1(j).name, '/', dirs_2(k).name, '/*.csv'));
            targets_file = readtable(strcat(targets_path.folder, '/', targets_path.name), 'PreserveVariableNames', true);
            dirs_3 = dir(strcat(data_path, '/', dirs(i).name, '/', dirs_1(j).name, '/', dirs_2(k).name, '/Dati'));
            
            %new 
            if i == 3 
                    T = removevars(targets_file,{'Data misurazione','Fuso orario', 'Pulse', 'Nome modello dispositivo'});
                else if i == 5 
                    T = removevars(targets_file,{'Eta'});
                else 
                    T = targets_file; 
                end 
            end
            targets  = [targets; T];

            for z = 3 : numel(dirs_3)
                dirs_4 = dir(strcat(data_path, '/', dirs(i).name, '/', dirs_1(j).name, '/', dirs_2(k).name, '/Dati/', dirs_3(z).name));
                %if i == 3
                %     t =  [targets_file(k-2, 2) targets_file(k-2, 3)];
                % elseif i == 4
                %    t =  [targets_file(k-2, 1) targets_file(k-2, 2)];
                %else
                %    t =  [targets_file(k-2, 1) targets_file(k-2, 2)];
                %end
                
                %targets = [targets; t];

                type =  erase({dirs_4.name}', "'");
                for n = 1 : numel(type)
                    if strcmp(type{n, :}, 'Braccio') || strcmp(type{n, :}, 'Polso') || strcmp(type{n, :}, 'Dorso')
                        if ~exist(strcat('../dataset/imgs/', type{n, :}), 'dir')
                            mkdir(strcat('../dataset/imgs/', type{n, :}));
                        end
                        
                        imgs_path = dir(strcat(data_path, '/', dirs(i).name, '/', dirs_1(j).name, '/', dirs_2(k).name, '/Dati/', dirs_3(z).name, '/', type{n, :}, '/*.jpg'));
                        %disp(imgs_path);
                        img = imread(strcat(imgs_path.folder, '/', imgs_path.name));                
                        
                        % Extract green channel
                        bw = imbinarize(img(:, :, 2), 'adaptive', 'Sensitivity', 0.75);
                        
                        img(:, :, 1) = double(img(:, :, 1)) .* bw;
                        img(:, :, 2) = double(img(:, :, 2)) .* bw;
                        img(:, :, 3) = double(img(:, :, 3)) .* bw;
                        
                        lab = rgb2lab(img);
                        light = lab(:, :, 1);
                        
                        scale_light = 1 - (light / 100.0);
                        
                        lab(:, :, 1) = lab(:, :, 1) .* scale_light;
                        img = lab2rgb(lab, 'OutputType', 'uint8');
                        img(:, :, 1) = img(:, :, 2);
                        img(:, :, 3) = img(:, :, 2);
                    
                        crop = min(size(img, 1), size(img, 2));
                        r = centerCropWindow2d(size(img), [crop crop]);
                        img = imcrop(img, r);
                        img = imresize(img, [512 512]);
                                                
                        imwrite(img, strcat('../dataset/imgs/', type{n, :}, '/', num2str(counter), '.jpg'));
                    end
                end
               
                counter = counter + 1;
            end
            continue;
        end
    end
end
writetable(targets, '../dataset/targets.csv');