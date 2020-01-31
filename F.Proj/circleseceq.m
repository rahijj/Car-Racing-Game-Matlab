function [yup,xrange] =circleseceq(x,h,k,xa,xb,In)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Y1=sqrt(400-((x-h).^2))+k;
if In==1
    d1=abs(k-Y1);
    Y1=k-d1;
end
xrange=[xa xb];
yup=Y1;
end

