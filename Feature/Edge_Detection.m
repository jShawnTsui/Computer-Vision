I = imread('zebra.jpg');
im = double(rgb2gray(I));
figure(1);
imshow(uint8(im),[]);
xlabel('Original Image');

% Partial derivatives of an Image
dx = [-1 1];
figure(2);
subplot(4,2,1);
imagesc(uint8(conv2(im,dx,'same')));
colormap gray;
ylabel('Partial derivatives');

dy = [-1; 1];
subplot(4,2,2);
imagesc(uint8(conv2(im,dy,'same')));
colormap gray;

% Sober Operator
sx = [-1 0 1; -2 0 2; -1 0 1];
sy = [-1 -2 -1; 0 0 0; 1 2 1];

subplot(4,2,3);
imagesc(uint8(conv2(im,sx,'same')));
colormap gray;
ylabel('Sober Operator');

subplot(4,2,4);
imagesc(uint8(conv2(im,sy,'same')));
colormap gray;

% Roberts Operator
rx = [0 1; -1 0];
ry = [1 0; 0 -1];

subplot(4,2,5);
imagesc(uint8(conv2(im,rx,'same')));
colormap gray;
ylabel('Roberts Operator');

subplot(4,2,6);
imagesc(uint8(conv2(im,ry,'same')));
colormap gray;

% Prewitt Operator
px = [-1 0 1; -1 0 1; -1 0 1];
py = [-1 -1 -1; 0 0 0; 1 1 1];

subplot(4,2,7);
imagesc(uint8(conv2(im,px,'same')));
colormap gray;
xlabel('$$\frac{\partial I}{\partial x}$$','interpreter','latex');
ylabel('Prewitt Operator');

subplot(4,2,8);
imagesc(uint8(conv2(im,py,'same')));
colormap gray;
xlabel('$$\frac{\partial I}{\partial y}$$','interpreter','latex');

% Smooth image first (Gaussian Filter)
fsize = 25;
figure(3);
for i=1:4
     h = fspecial('gaussian', fsize, i);
     out = imfilter(im, h);
     subplot(1,4,i);
     edge(out, 'canny');
     xlabel(strcat('\sigma = ', int2str(i)));
end
