dir_to_search = 'C:\Users\cruzk3\Documents\MATLAB\LAZData';
txtpattern = fullfile(dir_to_search, '*guam*.laz');
str = 'set';
dinfo = dir(txtpattern);
setsArr = struct('setNum', cell(1, 108), 'data', cell(1, 108));    

txt_notif = 'Done';

%thisdata = lasFileReader(thisfilename)

for K = 1 : length(dinfo)
  thisfilename = fullfile(dinfo(K).name);  %just the name
  thisdata = lasFileReader(thisfilename); %load just this file
   
    %name of the set
    setsArr(K).setNum = sprintf('%s_%d',str,K);
    %putting data into struct
    setsArr(K).data = thisdata;
    
    yeet = sprintf('%s_%d',txt_notif,K)
end

nat = 'Plotted'
figure();
hold on
for k = 1:length(setsArr)
   ptCloud = readPointCloud(setsArr(k).data);
   pcshow(ptCloud.Location);
   
   yeet = sprintf('%s_%d',nat,K)
end
hold off

%{
for n = 1:length(setsArr)
    setsArr(n).setNum
    setsArr(n).data
end
%}

