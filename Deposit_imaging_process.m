% This script is used to process deposit/liquid film images
% image_name: the file name of the image
% num_threshold: the number of grayscale threshold to be generated using Otsu's method
% median_dimen: the matrix dimension (i.e. how many neighbor points to be used for median) to be applied for median filter
% (1) To identify the area of the deposit/film
% (2) To generate accurate RGB image for CFD validation
% (3) To estimate the normalized deposit/film area
% (4) To estimate the normalized deposit/film mass
%% Input information for the image
prompts = {'Image name', 'num_threshold', 'median filter dimension'};
defaults = {'74031112.JPG', '3','3'};
answer = inputdlg(prompts, 'SCR deposit image porcessing', 1, defaults);
image_name = answer{1};
num_threshold= str2num(answer{2});
median_dimen= str2num(answer{3});
%% Basic information of image
[rows, columns, numberOfColorChannels] = size(image_name);
%% Import image
[RGB_ima,RGB_map]=imread(image_name); % read colorful image and generate it color map; 
%% Grayscale image
gray_ima=rgb2gray(RGB_ima); % convert the original RGB image to grayscale image based on grayscale=0.2989 * R + 0.5870 * G + 0.1140 * B 
double_gray_ima=im2double(gray_ima); % convert the unit8 data (i.e. 0-255) to double data (i.e. 0-1)
%% Segment the grayscale into different levels (background substraction: to correct the spatial intensity distribution of grayscale image)
thresh = multithresh(gray_ima,num_threshold);% returns thresh a 1-by-N vector containing N threshold values using Otsu’s method
[seg_gray_ima,index_seg_gray] = imquantize(gray_ima,thresh); % quantize the grayscale image using the N threshold value (as the quantization levels) determined by Otsu's method
%% Apply median filter to segmented grayscale image (to remove the small features in the image)
me_seg_gray_ima=medfilt2(seg_gray_ima,[median_dimen median_dimen]);
%% Apply threshold binarization to median filtered segmented grayscale image (to separate the area with deposit/film from the plate)
bina_me_seg_gray_ima=imbinarize(me_seg_gray_ima,'adaptive');
bina_me_seg_gray_ima1=imbinarize(me_seg_gray_ima,'global');

%% Label and Measure Connected Components in a Binary Image


cc = bwconncomp(bina_me_seg_gray_ima,4) % Calculate connected components
labeled = labelmatrix(cc) % Create a label matrix 
RGB_label = label2rgb(labeled,@copper,'c','shuffle'); % visualize connected components, display the label matrix as a pseudo-color image 
imshow(RGB_label)
%% Convert the segmented image into color image
converted_RGB = label2rgb(me_seg_gray_ima,'jet','w'); % convert the quantized grayscale image into RGB image with 'jet' colormap and white background (i.e. label 0)
double_converted_RGB=im2double(converted_RGB); % convert the unit8 data (i.e. 0-255) to double data (i.e. 0-1)
%% Add Pixel Information Tool to Figure and acquire the required pixel value range
% h=imshow();
% hp=impixelinfo; % 

%% Pixel points summation and value integration 
% (1) The number of certain pixels (value>certain value) represents the area
% (2) The integration of pixel value represnets the mass/thickness (the intensity of pixels can be thought as density)

Threshold_value=1 % the thresold value should be picked up according to the image
a=seg_gray_ima>1
numel(a(a>0)) % number of element in the indexed matrix that are larger than the threshold value




%% Image display
figure
imshowpair(RGB_ima,gray_ima,'montage')% compare the original image with gray scale image
figure
imshowpair(gray_ima,seg_gray_ima,'montage')% See the effects of segmentation on gray scale image
figure
imshowpair(seg_gray_ima,me_seg_gray_ima,'montage')% See the effects of median filter (eliminate small feature)
figure
imshowpair(me_seg_gray_ima,bina_me_seg_gray_ima,'montage') %
figure
imshowpair(bina_me_seg_gray_ima1,bina_me_seg_gray_ima,'montage') % Compare the adaptive and global binarization method
figure
imshowpair(bina_me_seg_gray_ima,converted_RGB,'montage')