function [yright,yleft,xrange] = righttilteq(x,xleftstart,yleftstart,xrightstart,yrightstart)
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here
m=(-50+30)/(70-50);
Y1=m.*(x-xrightstart)+yrightstart;
Y2=m.*(x-xleftstart)+yleftstart;
yright=Y1;
yleft=Y2;
xrange=[28 70];
end