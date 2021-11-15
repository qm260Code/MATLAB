function [] = DEPO_IMA_PROCESS(image_name,num_threshold,median_dimen)
% This function is used to process deposit/liquid film images
% image_name: the file name of the image
% num_threshold: the number of grayscale threshold to be generated using Otsu's method
% median_dimen: the matrix dimension (i.e. how many neighbor points to be used for median) to be applied for median filter
% (1) To identify the fringes of the deposit/film
%% Import image
[RGB_ima,RGB_map]=imread('image_name'); % read colorful image and generate it color map; 
imshow(RGB_ima,RGB_map) % show the image with its original color map;
title('Original image')
%% Grayscale image
gray_ima=rgb2gray(RGB_ima); % convert the original RGB image to grayscale image based on grayscale=0.2989 * R + 0.5870 * G + 0.1140 * B 
gray_map=rgb2gray(RGB_map); % convert the original color map to gray map;
%% Segment the grayscale into different levels (background substraction: to correct the spatial intensity distribution of grayscale image)
thresh = multithresh(gray_ima,num_threshold);% returns thresh a 1-by-N vector containing N threshold values using Otsu’s method
[seg_gray_ima,index_seg_gray] = imquantize(gray_ima,thresh); % quantize the grayscale image using the N threshold value (as the quantization levels) determined by Otsu's method
%% Apply median filter to segmented grayscale image (to remove the small features in the image)
me_seg_gray_ima=medfilt2(seg_gray_ima,[median_dimen median_dimen]);
%% Apply threshold binarization to median filtered segmented grayscale image (to separate the area with deposit/film from the plate)
bina_me_seg_gray_ima=imbinarize(me_seg_gray_ima,'global');
%% Convert the segmented image into color image
converted_RGB = label2rgb(me_seg_gray_ima,'jet','w'); % convert the quantized grayscale image into RGB image with 'jet' colormap and white background (i.e. label 0)
%% Pixel add and integration 
% (1) The number of certain pixels (value>certain value) represents the area
% (2) The integration of pixel value represnets the mass/thickness (the intensity of pixels can be thought as density)
%% Image display



end

