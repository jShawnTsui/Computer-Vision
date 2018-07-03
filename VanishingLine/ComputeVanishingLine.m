function ComputeVanishingLine
im = imread('undistorted.png');
figure(1);
imshow(im);
[x,y] = ginput(4);

% m11 = [2145;2120;1];
% m12 = [2566;1191;1];
% m13 = [1804;935;1];
% m14 = [1050;1320;1];
m11 = [x(1);y(1);1];
m12 = [x(2);y(2);1];
m13 = [x(3);y(3);1];
m14 = [x(4);y(4);1];

m21 = m11;
m22 = m14;
m23 = m12;
m24 = m13;

l11 = GetLineFromTwoPoints(m11,m12);
l12 = GetLineFromTwoPoints(m13,m14);

l21 = GetLineFromTwoPoints(m21,m22);
l22 = GetLineFromTwoPoints(m23,m24);

x1 = GetPointFromTwoLines(l11,l12)
x2 = GetPointFromTwoLines(l21,l22)

vanishing_line = GetLineFromTwoPoints(x1, x2)

figure(2);
clf;
% im = imread('undistorted.png');
hold on
d0 = m11(1);
d1 = x1(1);
y1 = -(l11(1)*d0+l11(3))/l11(2);
y2 = -(l11(1)*d1+l11(3))/l11(2);
plot([d0 d1], [y1 y2], 'r-');

hold on
d0 = m14(1);
d1 = x1(1);
y1 = -(l12(1)*d0+l12(3))/l12(2);
y2 = -(l12(1)*d1+l12(3))/l12(2);
plot([d0 d1], [y1 y2], 'r-');

hold on
d0 = m11(1);
d1 = x2(1);
y1 = -(l21(1)*d0+l21(3))/l21(2);
y2 = -(l21(1)*d1+l21(3))/l21(2);
plot([d0 d1], [y1 y2], 'b-');

hold on
d0 = m12(1);
d1 = x2(1);
y1 = -(l22(1)*d0+l22(3))/l22(2);
y2 = -(l22(1)*d1+l22(3))/l22(2);
plot([d0 d1], [y1 y2], 'b-');
hold on

imshow(im);
hold on
d0 = m11(1);
d1 = x1(1);
y1 = -(l11(1)*d0+l11(3))/l11(2);
y2 = -(l11(1)*d1+l11(3))/l11(2);
plot([d0 d1], [y1 y2], 'r-', 'LineWidth', 2);

hold on
d0 = m14(1);
d1 = x1(1);
y1 = -(l12(1)*d0+l12(3))/l12(2);
y2 = -(l12(1)*d1+l12(3))/l12(2);
plot([d0 d1], [y1 y2], 'r-', 'LineWidth', 2);

hold on
d0 = m11(1);
d1 = x2(1);
y1 = -(l21(1)*d0+l21(3))/l21(2);
y2 = -(l21(1)*d1+l21(3))/l21(2);
plot([d0 d1], [y1 y2], 'b-', 'LineWidth', 2);

hold on
d0 = m12(1);
d1 = x2(1);
y1 = -(l22(1)*d0+l22(3))/l22(2);
y2 = -(l22(1)*d1+l22(3))/l22(2);
plot([d0 d1], [y1 y2], 'b-', 'LineWidth', 2);

hold on
d0 = x1(1);
d1 = x2(1);
y1 = -(vanishing_line(1)*d0+vanishing_line(3))/vanishing_line(2);
y2 = -(vanishing_line(1)*d1+vanishing_line(3))/vanishing_line(2);
plot([d0 d1], [y1 y2], 'k--', 'LineWidth', 2);