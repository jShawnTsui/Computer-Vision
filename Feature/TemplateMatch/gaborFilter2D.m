function [filter_cos,filter_sin] = gaborFilter2D(T_f, theta, Sigma, len)
% This function returns two 2D Gabor quadrature filters
% (square matrices).
%
% ARGUMENTS
% - T_f: spatial period in pixels
% - theta: carrier orientation in degrees (0 corresponds
% to oscillation along x-axis only)
% - Sigma: covariance of Gaussian envelope
% - len: output is len x len.
%
% OUTPUT
% filter_cos, filter_sin: two 2d matrices containing the real part
% and the imaginary part of the filter

% Your code goes here %%%%%%%%%%%%%%%%%%%%%%
% use gaussian2d.m
g = gaussian2d(Sigma, len);
x = (1:len) - len/2 - 0.5;
[X, Y] = meshgrid(x, x);
theta = theta*pi/180;
X_theta=X*cos(theta)-Y*sin(theta);

filter_cos = g.*cos(2*pi*X_theta/T_f);
filter_sin = g.*sin(2*pi*X_theta/T_f);
% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%

