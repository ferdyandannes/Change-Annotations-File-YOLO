% person
% bicycle
% car
% motorbike

% Person            0 = 0
% Car               1 = 2
% Motorcycle        2 = 3
% Bicycle           3 = 1

%label TA
% Car                0 = 2
% Motorcycle         1 = 3
% Person             2 = 0
% Bicycle            3 = 1

clc; clear;
clear all;
close all;

%set annotation dataset path
anno_path = 'I:\SmartCampus_Test\Label';

%list all txt file
allTxt = dir(anno_path);
allTxt = {allTxt.name}';
allTxt = allTxt(3:end);

%for every annotation file
for i=1:length(allTxt)
     %open txt file
    txt_file = [anno_path '/' allTxt{i}];
    fileID = fopen(txt_file);
    data = textscan(fileID,'%f %f %f %f %f');
    fclose(fileID);
    data=cell2mat(data);
       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     % baris 1 kata ke 1
%     disp('data');
%     disp(data(1, 1));
%     
%     % baris 1 semuanya
%     disp('dataa');
%     disp(data(1, 1:5));
%     
%     
%     for j=1:size(data,1)
%         ganti kelas
%         if (data(j, 1)) == 0
%             data(j, 1) = 0;
%         elseif data(j, 1) == 1
%             data(j, 1) = 2;
%         elseif data(j, 1) == 2
%             data(j, 1) = 3;
%         elseif data(j,1) == 3
%             data(j, 1) = 1;
%         end
%         disp('data for');
%         disp(data(j, 1:5));
%     end
%     
%     disp('data baru');
%     disp(data);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %open new txt file
    fID = fopen(txt_file,'w');
    for j=1:size(data,1)
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       % ganti kelas
        if (data(j, 1)) == 0
            data(j, 1) = 1;
        elseif data(j, 1) == 1
            data(j, 1) = 2;
        elseif data(j, 1) == 2
            data(j, 1) = 0;
        elseif data(j,1) == 3
            data(j, 1) = 3;
        end
        %disp('data for');
        %disp(data(j, 1:5));
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
        
        fprintf(fID,'%d %f %f %f %f\n',data(j,1:5));
        %disp('awwww')
        %disp('1 %f %f %f %f \n',data(j,2:5))
    end
    fclose(fID);
end

disp('Mari boy');