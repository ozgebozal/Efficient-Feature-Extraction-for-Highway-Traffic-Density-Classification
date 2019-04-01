%addpath ('C:\Users\LENOVO\Desktop\Spring17\ee58j\proje\trafficdb\image\images')
function SURF_features(path)
files=getAllFiles(path);
numFiles=length(files);
%ImCell=cell(1,53);   %take all 53 images
%SURFHist=zeros(numFiles-1,sizeBin);
for IM=1:numFiles
im=imread(files{IM});
[row,column,color]=size(im);
im=imresize(im,[row,column]);
im=rgb2gray(im);

points = detectSURFFeatures(im);

figure
imshow(im)
hold on
%%how to optimize number of storngest points???
plot(points.selectStrongest(100))
end
