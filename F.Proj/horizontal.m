function [] = horizontal(xa,xb,ya,yb)
%STRAIGHT sec of track
%   Func returns value of y coordinate for comparison to keep car on track.
m=0;
x1=[xa xb];
y1=m.*x1+ya;
y2=m.*x1+yb;
fill([xa,xb,xb,xa,xa],[y1(1),y1(2),y2(2),y2(1),y1(1)],[0.1 0.1 0.1],'edgecolor','none')
plot(x1,y1,'linewidth',6,'color','y');
plot(x1,y2,'linewidth',6,'color','y');
plot(x1,((y1+y2)./2),'linewidth',4,'color','w');
end

