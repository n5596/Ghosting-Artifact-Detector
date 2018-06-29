clc;
close all;
clear all;

% img = imread('Video1/img00136.jpg');

img = imread('test.jpeg');
img = imresize(img,[1080, 1920]);

[h, w, s] = size(img);
d = 15;

mask = createmask(img, d);
im_mask = mask/sum(mask(:));
patches = imfilter(img, im_mask);

[c_img, loc_img] = classify_image(img, d, mask);
eval_metric = metric(c_img, d, h, w);

figure, imshow(uint8(loc_img));
disp('THE EVALUATION METRIC IS:');
disp(eval_metric);

