function[dctHist]=dctFMD(path)
%addpath('/Users/ferhatmelih/Google Drive/ee58j_term_project/images/')
files=getAllFiles(path);
numFiles=length(files);
Im=cell(1,53);   %take all 53 images
sizeBin=128;   %BIN SIZE
dctHist=zeros(numFiles-1,sizeBin);
Im{1}=imread(files{2});
Im{1}=rgb2gray(Im{1});          %RGBtoGRAY
imSize=size(Im{1});             
for i=2:numFiles-1            %Difference image Loop
   Im{i}=imread(files{i+1}); 
   Im{i}=rgb2gray(Im{i});
   ImOld=Im{i-1};
   ImCurrent=Im{i};
   ImDiff=ImCurrent-ImOld;
   temp=dct2(ImDiff,sizeBin,sizeBin);
   histB=histogram(temp,sizeBin);
   dctHist(i-1,:)=histB.Values;
end

end