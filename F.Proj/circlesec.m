function [] =circlesec(h,k,xa,xb,i,In)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
x1=xa:i:xb;
x2=xa:i:((xb+xa)/2);
y1=sqrt(400-((x1-h).^2))+k;
y2=sqrt(100-((x2-h).^2))+k;
if In==1
    d1=abs(k-y1);
    d2=abs(k-y2);
    y1=k-d1;
    y2=k-d2;
end
fill([h,x1,h],[k,y1,k],[0.1 0.1 0.1],'edgecolor','none')

plot(x1,y1,'linewidth',6,'color','y');

plot(x2,y2,'linewidth',4,'color','w');
end

