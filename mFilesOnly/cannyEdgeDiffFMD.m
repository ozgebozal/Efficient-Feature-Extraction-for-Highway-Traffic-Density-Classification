addpath('/Users/ferhatmelih/Google Drive/ee58j_term_project/images/')
files=getAllFiles('/Users/ferhatmelih/Google Drive/ee58j_term_project/images/');
numFiles=length(files);
Im=cell(1,53);   %take all 53 images
diff=zeros(numFiles,1);
Im{1}=imread(files{1});
Im{1}=Im{1}(18:240,129:320,:);  %crop appropriately
Im{1}=rgb2gray(Im{1});          %RGBtoGRAY
imSize=size(Im{1});             
for i=2:5              %Difference image Loop
   imPath=files{i};
   Im{i}=imread(files{i}); Im{i}=Im{i}(18:240,129:320,:); 
   Im{i}=rgb2gray(Im{i});
   ImOld=Im{i-1};
   ImCurrent=Im{i};
   ImDiff=ImCurrent-ImOld;
   %ImDiff=imgaussfilt(ImDiff,2);
   ImEdge = edge(ImDiff,'canny');  
   figure,
   imshow(ImEdge);
end
