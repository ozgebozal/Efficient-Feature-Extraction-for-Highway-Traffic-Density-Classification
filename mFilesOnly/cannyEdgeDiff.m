function[diffNum]=cannyEdgeDiff(path)
%addpath('C:\Users\LENOVO\Desktop\Spring17\ee58j\proje\trafficdb\image\images')
files=getAllFiles(path);
numFiles=length(files);
Im=cell(1,53);     %take all 53 images
diffNum=cell(numFiles-1,1);
Im{1}=imread(files{1});
%Im{1}=Im{1}(18:240,129:320,:); %crop appropriately
Im{1}=rgb2gray(Im{1});         %RGBtoGRAY
imSize=size(Im{1});
for i=2:numFiles            %Difference image Loop
   imPath=files{i};
   Im{i}=imread(files{i}); %Im{i}=Im{i}(18:240,129:320,:); %Next im Crop
   Im{i}=rgb2gray(Im{i});    
   ImOld=Im{i-1};     % old im
   ImCurrent=Im{i};   %current im
   ImDiff=ImCurrent-ImOld; %difference
   %ImDiff=imgaussfilt(ImDiff,0.5);
   ImEdge = edge(ImDiff,'canny',0.2); 
   diffNum{i-1,1}=sum(sum(ImEdge));
  
   %figure,
   %imshow(ImEdge);
end