function [yup,ylow,xrange] = horizontaleq(x,xa,xb,ya,yb)
%STRAIGHT sec of track
%   Func returns value of y coordinate for comparison to keep car on track.
m=0;
Y1=m.*x+ya;
Y2=m.*x+yb;
yup=Y1;
ylow=Y2;
xrange=[xa,xb];
end