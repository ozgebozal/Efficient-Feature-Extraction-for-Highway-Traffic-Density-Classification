%addpath('/Users/ferhatmelih/Google Drive/ee58j_term_project/crop/')
function changeP=pixelComparison(path)
files=getAllFiles(path);
numFiles=length(files);
Im=cell(1,53);
diff=zeros(numFiles,1);
Im{1}=imread(files{1});
Im{1}=rgb2hsv(Im{1});
%Im{1}=Im{1}(18:240,129:320,:);
imSize=size(Im{1});
changeP=zeros(numFiles-1,2);
for i=2:numFiles
    a=0;
   imPath=files{i};
   Im{i}=imread(files{i}); Im{i}=rgb2hsv(Im{i});
   ImOld=Im{i-1};
   ImCurrent=Im{i}; 
   ImDif=ImCurrent-ImOld;
   value=ImDif(:,:,3);
   color=ImDif(:,:,1);
   value(abs(value)>0.08)=1;
   value(abs(value)<=0.08)=0;
   color(abs(color)>0.1)=1;
   color(abs(color)<=0.1)=0;
   valueIM=mat2gray(value);
   colorIM=mat2gray(color);
   changeP(i-1,1)=sum(sum(value));
   changeP(i-1,2)=sum(sum(color));
end

