clc; clear;
clear all;
close all;

%set annotation dataset path
anno_path = 'H:\val2014';
anno_path_new = 'H:\Val_new';

%list all txt file
allTxt = fullfile(anno_path, '*.txt');
kucing = dir(allTxt);
kucing = {kucing.name};

%list all jpg file
allJpg = fullfile(anno_path, '*.txt');
gambar = dir(allJpg);
gambar = {gambar.name};

%disp('jumlah file')
%disp(kucing)

for i=1:length(kucing)
   txt_file = [anno_path '/' kucing{i}];
   fileID = fopen(txt_file);
   
   data = textscan(fileID,'%f %f %f %f %f');
   fclose(fileID);
   data=cell2mat(data);
   
   %disp('id')
   %disp(kucing{i})
   
   C = strsplit(kucing{i},'.')
   %disp('c')
   %disp(C{1})
   
   data(:,1)
   %disp('data pertama')
   %disp(data(:,1))
   
   if sum((data(:,1) == 0 | data(:,1) == 1 | data(:,1) == 2 | data(:,1) == 3)) > 0
       % write to new file
       txt_file_new = [anno_path_new '/' kucing{i}];
       fID = fopen(txt_file_new,'w');
   
       for j=1:size(data,1)
           %disp('sini')
           %disp(data(j, 1))
           if (data(j, 1) == 0 || data(j, 1) == 1 || data(j, 1) == 2 || data(j,1) == 3)
               disp('nol');
               fprintf(fID,'%d %f %f %f %f\n',data(j,1:5));
           else
               disp('haputets file');
           end  
       end

       %allJpg = fullfile(C{1}, '*.jpg');
       %list = dir(C{1}.jpg);
       a = C{1};
       s1 = C{1};
       s2 = '.jpg';
       s = strcat(s1,s2)
       %disp('a')
       %disp(s)
       I = imread(s);
       %imshow(I)
       fullFileName = fullfile(anno_path_new, s)
       imwrite(I, fullFileName);
       
       fclose(fID);
   else
    disp('ga masuk')
   end
   disp('Next');
end

disp('Mari boy');