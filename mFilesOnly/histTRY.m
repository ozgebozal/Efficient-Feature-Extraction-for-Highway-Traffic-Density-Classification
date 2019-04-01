addpath('/Users/ferhatmelih/Google Drive/ee58j_term_project/images');
addpath('/Users/ferhatmelih/Google Drive/ee58j_term_project/matlab/Lloyd/');
Im=imread('001.jpg');
Im=rgb2gray(Im);
hist=histogram(Im,10);
vals=hist.Values;


