function g = gaussian2d(Sigma, len)
% GAUSSIAN2D - make discrete normalized centered 2D Gaussian
%
% Syntax: g = gaussian2d(Sigma, len);
%
% Output is symmetric with unit sampling period.
% (0,0) is sampled only when len is odd.
%
% Inputs:
%   Sigma: 2x2 covariance matrix
%   len: output is len x len.
%

% Your code goes here %%%%%%%%%%%%%%%%%%%%%%
x = (1:len) - len/2 - 0.5;
[X, Y] = meshgrid(x, x);
g = mvnpdf([X(:) Y(:)], [0 0], Sigma);
g = reshape(g, len, len)/sum(g(:));
% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%