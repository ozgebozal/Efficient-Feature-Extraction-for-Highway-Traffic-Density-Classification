%%%%yildizli pek iyi!!!

addpath ('C:\Users\LENOVO\Desktop\Spring17\ee58j\proje\trafficdb\image\images')

im=imread('050.jpg');
im=crop(im);
I=im;
image=im;
[row column color]=size(im);
im=imresize(im,[row,column]);
im=rgb2gray(im);

corners = detectHarrisFeatures(im);
[features, valid_corners] = extractFeatures(im, corners);

figure; imshow(I)
hold on
plot(valid_corners)

