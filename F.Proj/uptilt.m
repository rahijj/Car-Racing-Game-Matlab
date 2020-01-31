function [] = uptilt(xa,xb,ya,yb)
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here
m=(30-10)/(30-(-10));
x1=[xa,xb];
y1=m.*(x1-xa)+ya;
y2=m.*(x1-xa)+yb;
fill([xa,xb,xb,xa,xa],[y1(1),y1(2),y2(2),y2(1),y1(1)],[0.1 0.1 0.1],'edgecolor','none')
plot(x1,y1,'linewidth',6,'color','y');
plot(x1,y2,'linewidth',6,'color','y');
plot(x1,((y2+y1)./2),'linewidth',4,'color','w');
end

