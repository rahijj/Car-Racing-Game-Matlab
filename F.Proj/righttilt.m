function [] = righttilt(xleftstart,xleftend,yleftstart,xrightstart,xrightend,yrightstart)
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here
m=(-50+30)/(70-50);
x1=[xleftstart xleftend];
y1=m.*(x1-xleftstart)+yleftstart;
x2=[xrightstart xrightend];
y2=m.*(x2-xrightstart)+yrightstart;
fill([xleftstart,xleftend,xrightend,xrightstart,xleftstart],[yleftstart,y1(2),y2(2),yrightstart,yleftstart],[0.1 0.1 0.1],'edgecolor','none')
plot(x1,y1,'linewidth',6,'color','y');
plot(x2,y2,'linewidth',6,'color','y');
plot(((x1+x2)./2),y2,'linewidth',4,'color','w');
end