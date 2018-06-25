im = imread('/Image/Lenna.jpg');
im_gray = rgb2gray(im);
figure(1);
imshow(im_gray,[]);

% Gaussian Noise
sigma = 32;
noise = randn(size(im_gray)).*sigma;
im_gaus_noise = im_gray + uint8(noise);
figure(2);
imshow(im_gaus_noise,[]);

% Salt and Pepper Noise
% im_salt_noise = imnoise(im_gray, 'salt & pepper', 0.05);
black = 5;
white = 250;
noise = randi([0, 255], size(im_gray));
im_salt_noise = im_gray;
im_salt_noise(noise <= black) = 0;
im_salt_noise(noise >= white) = 255;
figure(3);
imshow(im_salt_noise,[]);

% Linear Filter 1
f1 = ones(3) / 9;
out1 = conv2(double(im_gray), f1, 'same');
figure(4);
imshow(out1,[]);

% Linear Filter 2
f2 = zeros(3);
f2(2,2) = 2;
f2 = f2 - f1;
out2 = conv2(double(im_gray), f2, 'same');
figure(5);
imshow(uint8(out2),[]);

% Gaussian Filter
gaus_filter = fspecial('gaussian', 10, 5);
figure(6);
mesh(gaus_filter);
% imagesc(gaus_filter);
im_gaus_filter = conv2(double(im_gray), gaus_filter, 'same');
figure(7);
imshow(uint8(im_gaus_filter), []);

% Median Filter
im_med_filter = medfilt2(im_salt_noise, [3,3]);
figure(8)
imshowpair(im_salt_noise, im_med_filter, 'montage');