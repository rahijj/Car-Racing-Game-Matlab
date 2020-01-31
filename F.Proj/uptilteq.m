function [yup,ylow,xrange] = uptilteq(x,xa,xb,ya,yb)
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here
m=(30-10)/(30-(-10));
Y1=m.*(x-xa)+ya;
Y2=m.*(x-xa)+yb;
yup=Y1;
ylow=Y2;
xrange=[xa xb];
end

