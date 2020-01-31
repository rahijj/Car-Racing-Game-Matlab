function [] = verticle(x1start,x1end,y1start,y1end,x2start,x2end,y2start,y2end)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
x1=[x1start x1end];
y1=[y1start y1end];
x2=[x2start x2end];
y2=[y1start y2end];
fill([x1start,x1end,x2end,x2start,x1start],[y1start,y1end,y2end,y2start,y1start],[0.1 0.1 0.1],'edgecolor','none')
plot(x1,y1,'linewidth',6,'color','y')
plot(x2,y2,'linewidth',6,'color','y')
plot(((x1+x2)./2),y2,'linewidth',4,'color','w')
end

