clc;
clear all;
close all;
a=imread('C:\Users\Rohan Prabhu\Downloads\lenna.jpg');
wirgb=imread('C:\Users\Rohan Prabhu\Downloads\logo.jpg');
wi=rgb2gray(wirgb);
w=double(wi);
[ll lh hl hh]=dwt2(a,'haar');
[ull sll vll]=svd(ll);
sll2=sll+0.04035*w;
[sll21 sll22 sll23]=svd(sll2);
imgll=ull*sll22*vll';
sz=size(a);
imgaw=idwt2(imgll,lh,hl,hh,'haar',sz);

figure
imshow(a);
figure
imshow([ll/255 lh/255;hl/255 hh/255]);
ac=uint8(imgaw);
figure
imshow(ac);
%de-watermarking
%i/p=imgaw,sll,slh,shl,shh,sll21,sll23,slh21,slh23,shl21,shl23,slh21,slh23,shh21,shh23



% nac_rot=imrotate(ac,-270,'bilinear','crop');
% figure 
% imshow(nac_rot);
% 
% nac_tran=imtranslate(ac,[10,25]);
% figure 
% imshow(nac_tran);

nac_22=medfilt2(ac,[2,2]);
figure 
imshow(nac_22);

nac_33=medfilt2(ac,[3,3]);
figure 
imshow(nac_33);

nac_55=medfilt2(ac,[5,5]);
figure 
imshow(nac_55);

nac_77=medfilt2(ac,[7,7]);
figure 
imshow(nac_77);

nac_99=medfilt2(ac,[9,9]);
figure 
imshow(nac_99);

nac_1111=medfilt2(ac,[11,11]);
figure 
imshow(nac_1111);

nac_1313=medfilt2(ac,[13,13]);
figure 
imshow(nac_1313);



[dll dlh dhl dhh]=dwt2(imgaw,'haar');

[dll1 dlh1 dhl1 dhh1]=dwt2(nac_22,'haar');
[dll2 dlh2 dhl2 dhh2]=dwt2(nac_33,'haar');
[dll3 dlh3 dhl3 dhh3]=dwt2(nac_55,'haar');
[dll4 dlh4 dhl4 dhh4]=dwt2(nac_77,'haar');
[dll5 dlh5 dhl5 dhh5]=dwt2(nac_99,'haar');
[dll6 dlh6 dhl6 dhh6]=dwt2(nac_1111,'haar');
[dll7 dlh7 dhl7 dhh7]=dwt2(nac_1313,'haar');
% [dll7 dlh7 dhl7 dhh7]=dwt2(nac_median_filter,'haar');
% [dll8 dlh8 dhl8 dhh8]=dwt2(nac_center_crop,'haar');
% [dll9 dlh9 dhl9 dhh9]=dwt2(nac_hist_eq,'haar');
% [dll10 dlh10 dhl10 dhh10]=dwt2(nac_cut_col,'haar');

[udll sdll vdll]=svd(dll);

[udll1 sdll1 vdll1]=svd(dll1);
[udll2 sdll2 vdll2]=svd(dll2);
[udll3 sdll3 vdll3]=svd(dll3);
[udll4 sdll4 vdll4]=svd(dll4);
[udll5 sdll5 vdll5]=svd(dll5);
[udll6 sdll6 vdll6]=svd(dll6);
[udll7 sdll7 vdll7]=svd(dll7);
% [udll8 sdll8 vdll8]=svd(dll8);
% [udll9 sdll9 vdll9]=svd(dll9);
% [udll10 sdll10 vdll10]=svd(dll10);

d1=sll21*sdll*sll23';

d2=sll21*sdll1*sll23';
d3=sll21*sdll2*sll23';
d4=sll21*sdll3*sll23';
d5=sll21*sdll4*sll23';
d6=sll21*sdll5*sll23';
d7=sll21*sdll6*sll23';
d8=sll21*sdll7*sll23';
% d9=sll21*sdll8*sll23';
% d10=sll21*sdll9*sll23';
% d11=sll21*sdll10*sll23';

o1=(d1-sll)./0.04035;

o2=(d2-sll)./0.04035;
o3=(d3-sll)./0.04035;
o4=(d4-sll)./0.04035;
o5=(d5-sll)./0.04035;
o6=(d6-sll)./0.04035;
o7=(d7-sll)./0.04035;
o8=(d8-sll)./0.04035;
% o9=(d9-sll)./0.05;
% o10=(d10-sll)./0.05;
% o11=(d11-sll)./0.05;

figure
imshow(wi);

figure
imshow(o1/255);
o1i=uint8(o1);
corr_original=corr2(o1i,wi)

figure
imshow(o2/255);
o2i=uint8(o2);
corr_22=corr2(o2i,wi)

figure
imshow(o3/255);
o3i=uint8(o3);
corr_33=corr2(o3i,wi)

figure
imshow(o4/255);
o4i=uint8(o4);
corr_55=corr2(o4i,wi)

figure
imshow(o5/255);
o5i=uint8(o5);
corr_77=corr2(o5i,wi)

figure
imshow(o6/255);
o6i=uint8(o6);
corr_99=corr2(o6i,wi)

figure
imshow(o7/255);
o7i=uint8(o7);
corr_1111=corr2(o7i,wi)

figure
imshow(o8/255);
o8i=uint8(o8);
corr_1313=corr2(o8i,wi)

% figure
% imshow(o8/255);
% o8i=uint8(o8);
% corr_median_filter=corr2(o8i,wi)
% 
% figure
% imshow(o9/255);
% o9i=uint8(o9);
% corr_center_crop=corr2(o9i,wi)
% 
% figure
% imshow(o10/255);
% o10i=uint8(o10);
% corr_hist_eq=corr2(o10i,wi)
% 
% figure
% imshow(o11/255);
% o11i=uint8(o11);
% corr_cut_col=corr2(o11i,wi)

psnr1=psnr(ac,a)
