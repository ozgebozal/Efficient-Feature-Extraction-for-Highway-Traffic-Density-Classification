function [histVec]=edge_histogram(path)
files=getAllFiles(path);
numFiles=length(files);
histVec=cell(numFiles,1);   %take all 53 images
for IM=1:numFiles
I=imread(files{IM});
[row,column,color]=size(I);
%im=crop(I);
im=rgb2gray(I);
im=imresize(im,[240,320]);
imblock_size=5;
%x=sqrt(h*v/16);
im=im/2;
[h,v]=size(im);
gridSize_h=h/4;
gridSize_v=v/4;
N1 = (gridSize_h)*ones(1,4);
N2 = (gridSize_v)*ones(1,4);
im_cell = mat2cell(im,N1,N2);

thresh=70;

hh=[1 1;-1 -1];
hv=[1 -1;1 -1];
h45=[sqrt(2) 0;0 -sqrt(2)];
h135=[0 sqrt(2);-sqrt(2) 0];
h_non=[2 -2;-2 2];
hist_imblock=zeros(5,16);

for k=1:16
n1=12*ones(1,imblock_size);
n2=16*ones(1,imblock_size);
c{k}=mat2cell(im_cell{k},n1,n2);
end

for k=1:16
    h1=h/4/imblock_size; v1=v/4/imblock_size;
  for i=1:imblock_size^2
    a0=mean2(c{k}{i}(1:h1/2,1:v1/2));
    a1=mean2(c{k}{i}(1:h1/2,v1/2+1:v1));
    a2=mean2(c{k}{i}(h1/2+1:h1,1:v1/2));
    a3=mean2(c{k}{i}(h1/2+1:h1,v1/2+1:v1));
    A=[a0 a1;a2 a3];
    
    ver_stg=norm(imfilter(A,hh)); 
    hor_stg=norm(imfilter(A,hv));  
    a45_stg=norm(imfilter(A,h45));  
    a135_stg=norm(imfilter(A,h135));  
    non_stg=norm(imfilter(A,h_non)); 
    
   
    [edge, index]=max([ver_stg,hor_stg,a45_stg,a135_stg,non_stg]);
    if edge>thresh
        hist_imblock(index,k)=hist_imblock(index,k)+1;
    end
  end
  
end
hist_imblock=normc(hist_imblock);
%yedek=hist_imblock(:)
hist=LMAX((hist_imblock(:))');
histVec{IM,1}=hist;
end

end


