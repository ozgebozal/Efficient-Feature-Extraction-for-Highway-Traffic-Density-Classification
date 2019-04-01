addpath ('C:\Users\LENOVO\Desktop\Spring17\ee58j\proje\trafficdb\image\images')

I1=imread('001.jpg');
im=crop(I1);

I1=im;
[row column color]=size(im);
%im=imresize(im,[row,column]);
im=rgb2gray(im);

points = detectFASTFeatures(im);

figure
imshow(I1)
hold on
plot(points.selectStrongest(100))
