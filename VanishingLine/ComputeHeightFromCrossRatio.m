function ComputeHeightFromCrossRatio

im = imread('cross_ratio.png');

m1 = [1781;1727;1];
m2 = [2634;1116;1];
m3 = [1393;1447;1];
m4 = [2338;1060;1];

m5 = [827; 204; 1];
m6 = [925;738;1];
m7 = [2909;293;1];
m8 = [2834;785;1];

H_R = 1.60; % sh_height

sh_f = [1504;1447;1];
sh_h = [1468;730;1];
jp_f = [1997;1175;1];
jp_h = [1997;695;1];

l11 = GetLineFromTwoPoints(m1,m2);
l12 = GetLineFromTwoPoints(m3,m4);
l21 = GetLineFromTwoPoints(m1,m3);
l22 = GetLineFromTwoPoints(m2,m4);

v1 = GetPointFromTwoLines(l11,l12);
v2 = GetPointFromTwoLines(l21,l22);
l = GetLineFromTwoPoints(v1,v2);

line_sh_jp_f = GetLineFromTwoPoints(sh_f, jp_f);
v = GetPointFromTwoLines(line_sh_jp_f, l);

line_jp_h_v = GetLineFromTwoPoints(jp_h, v);

l31 = GetLineFromTwoPoints(m5,m6);
l32 = GetLineFromTwoPoints(m7,m8);
v3 = GetPointFromTwoLines(l31,l32);

line_sh = GetLineFromTwoPoints(v3, sh_f);
p2  = GetPointFromTwoLines(line_jp_h_v, line_sh);
p3 = sh_h;
p1 = sh_f;

p4 = v3;

h_prime = norm(p1-p2);
h_R = norm(p1-p3);
h_prime_inf = norm(p4-p2);
h_inf = norm(p4-p3);

H = H_R * h_prime * h_inf / h_R / h_prime_inf


figure(1);
clf;
d0 = m1(1);
d1 = v1(1);
y1 = -(l11(1)*d0+l11(3))/l11(2);
y2 = -(l11(1)*d1+l11(3))/l11(2);
plot([d0 d1], [y1 y2], 'r-');

hold on
d0 = m3(1);
d1 = v1(1);
y1 = -(l12(1)*d0+l12(3))/l12(2);
y2 = -(l12(1)*d1+l12(3))/l12(2);
plot([d0 d1], [y1 y2], 'r-');

hold on
d0 = m1(1);
d1 = v2(1);
y1 = -(l21(1)*d0+l21(3))/l21(2);
y2 = -(l21(1)*d1+l21(3))/l21(2);
plot([d0 d1], [y1 y2], 'g-');

hold on
d0 = m2(1);
d1 = v2(1);
y1 = -(l22(1)*d0+l22(3))/l22(2);
y2 = -(l22(1)*d1+l22(3))/l22(2);
plot([d0 d1], [y1 y2], 'g-');
hold on

% hold on
% d0 = m5(1);
% d1 = v3(1);
% y1 = -(l31(1)*d0+l31(3))/l31(2);
% y2 = -(l31(1)*d1+l31(3))/l31(2);
% plot([d0 d1], [y1 y2], 'b-');
% 
% hold on
% d0 = m7(1);
% d1 = v3(1);
% y1 = -(l32(1)*d0+l32(3))/l32(2);
% y2 = -(l32(1)*d1+l32(3))/l32(2);
% plot([d0 d1], [y1 y2], 'b-');
% hold on

imshow(im);
hold on
d0 = m1(1);
d1 = v1(1);
y1 = -(l11(1)*d0+l11(3))/l11(2);
y2 = -(l11(1)*d1+l11(3))/l11(2);
plot([d0 d1], [y1 y2], 'r-');

hold on
d0 = m3(1);
d1 = v1(1);
y1 = -(l12(1)*d0+l12(3))/l12(2);
y2 = -(l12(1)*d1+l12(3))/l12(2);
plot([d0 d1], [y1 y2], 'r-');

hold on
d0 = m1(1);
d1 = v2(1);
y1 = -(l21(1)*d0+l21(3))/l21(2);
y2 = -(l21(1)*d1+l21(3))/l21(2);
plot([d0 d1], [y1 y2], 'g-');

hold on
d0 = m2(1);
d1 = v2(1);
y1 = -(l22(1)*d0+l22(3))/l22(2);
y2 = -(l22(1)*d1+l22(3))/l22(2);
plot([d0 d1], [y1 y2], 'g-');

% hold on
% d0 = m5(1);
% d1 = v3(1);
% y1 = -(l31(1)*d0+l31(3))/l31(2);
% y2 = -(l31(1)*d1+l31(3))/l31(2);
% plot([d0 d1], [y1 y2], 'b-');
% 
% hold on
% d0 = m7(1);
% d1 = v3(1);
% y1 = -(l32(1)*d0+l32(3))/l32(2);
% y2 = -(l32(1)*d1+l32(3))/l32(2);
% plot([d0 d1], [y1 y2], 'b-');
hold on

hold on
d0 = 0;
d1 = size(im,2);
y1 = -(l(1)*d0+l(3))/l(2);
y2 = -(l(1)*d1+l(3))/l(2);
plot([d0 d1], [y1 y2], 'm:', 'LineWidth', 2);

hold on
d0 = sh_f(1);
d1 = v(1);
y1 = -(line_sh_jp_f(1)*d0+line_sh_jp_f(3))/line_sh_jp_f(2);
y2 = -(line_sh_jp_f(1)*d1+line_sh_jp_f(3))/line_sh_jp_f(2);
plot([d0 d1], [y1 y2], 'c:', 'LineWidth', 2);

% hold on
% d0 = sh_head(1);
% d1 = v(1);
% y1 = -(line_sh_head_v(1)*d0+line_sh_head_v(3))/line_sh_head_v(2);
% y2 = -(line_sh_head_v(1)*d1+line_sh_head_v(3))/line_sh_head_v(2);
% plot([d0 d1], [y1 y2], 'c:', 'LineWidth', 2);


hold on
d0 = sh_h(1);
d1 = v(1);
y1 = -(line_jp_h_v(1)*d0+line_jp_h_v(3))/line_jp_h_v(2);
y2 = -(line_jp_h_v(1)*d1+line_jp_h_v(3))/line_jp_h_v(2);
plot([d0 d1], [y1 y2], 'c:', 'LineWidth', 2);

hold on
plot(sh_h(1), sh_h(2), 'cx');
