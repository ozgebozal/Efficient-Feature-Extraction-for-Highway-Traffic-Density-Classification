subplot(231)
im2=imfilter(im,hh);
imshow(im2);
title('Horizontal Edges');

subplot(232)
im3=imfilter(im,hv);
imshow(im3);
title('Vertical Edges');
subplot(233)
im4=imfilter(im,h45);
imshow(im4);
title('45 degree Edges');
subplot(234)
im5=imfilter(im,h135);
imshow(im5);
title('135 degree Edges');
subplot(235)
im6=imfilter(im,h_non);
imshow(im6);
title('Non-Directional Edges');
