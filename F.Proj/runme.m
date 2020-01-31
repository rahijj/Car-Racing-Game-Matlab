function runme()
% initializations
clear;
figure;
hold on
axis equal
axis off
axis ([-150 100 -150 50]);
[cover,map,Alpha]=imread('cover.jpg');
flipimg=flipud(cover);
cov=image(flipimg);
set(cov,'xdata',[-150 100])
set(cov,'ydata',[-150 50])
text(40,-140,'RAHIJ GILLANI','fontsize',9,'color','w')
[q,Fs] = audioread('back.mp3');
sound(q,Fs)
pause(5)
grass=imread('mygrass.jpg');
image1=image(grass);
pepsilogo=imread('pepsi.jpg');
pepsi=image(pepsilogo);
shelllogo=imread('shelllogo.jpg');
shell=image(shelllogo);
[bmwlogo,map,alpha4]=imread('BMW.png');
bmw=image(bmwlogo);
[lumslogo,map,alphadata3]=imread('LUMS.png');
lums=image(lumslogo);
set(gca,'YDir','normal');
set(image1,'ydata',[-150 50]);
set(image1,'xdata',[-150 100]);
set(shell,'xdata',[-40 10]);
set(shell,'ydata',[-80 -98]);
set(pepsi,'xdata',[-50 -10]);
set(pepsi,'ydata',[30 11]);
set(bmw,'xdata',[49 85]);
set(bmw,'ydata',[10 -25]);
set(bmw,'alphadata',alpha4);
set(lums,'xdata',[-64 26]);
set(lums,'ydata',[-22 -70]);
set(lums,'alphadata',alphadata3);
hold on
%calling track functions
horizontal(-70,-10,10,-10);%horizontal(xa,xb,ya,yb)
uptilt(-10,30,10,-10);%uptilteq(x,xa,xb,ya,yb)
circlesec(30,10,30,50,1,0);%circle(h,k,xa,xb,increment,inverse(1=yes,0=no)) radius=20
verticle(30,30,10,-30,50,50,10,-30);%verticle(x1start,x1end,y1start,y1end,x2start,x2end,y2start,y2end)
righttilt(30,50,-30,50,70,-30);%righttilt(xleftstart,xleftend,yleftstart,xrightstart,xrightend,yrightstart)
verticle(50,50,-50,-100,70,70,-50,-100);%verticle(x1start,x1end,y1start,y1end,x2start,x2end,y2start,y2end)
circlesec(50,-100,50,70,1,1);%circle(h,k,xa,xb,increment,inverse(1=yes,0=no)) radius=20
horizontal(50,-100,-100,-120);%horizontal(xa,xb,ya,yb)
circlesec(-100,-100,-100,-120,-1,1);%circle(h,k,xa,xb,increment,inverse(1=yes,0=no)) radius=20
verticle(-100,-100,-100,-90,-120,-120,-100,-90);%verticle(x1start,x1end,y1start,y1end,x2start,x2end,y2start,y2end)
circlesec(-100,-90,-100,-120,-1,0);%circle(h,k,xa,xb,increment,inverse(1=yes,0=no)) radius=20
horizontal(-100,-90,-70,-90);%horizontal(xa,xb,ya,yb)
circlesec(-90,-70,-90,-70,1,1);%circle(h,k,xa,xb,increment,inverse(1=yes,0=no)) radius=20
verticle(-70,-70,-70,-10,-90,-90,-70,-10);%verticle(x1start,x1end,y1start,y1end,x2start,x2end,y2start,y2end)
circlesec(-70,-10,-70,-90,-1,0);%circle(h,k,xa,xb,increment,inverse(1=yes,0=no)) radius=20
%smoke sprites
[smoke1,map,alpha5]=imread('smoke1.png');
[smoke2,map,alpha6]=imread('smoke2.png');
[smoke3,map,alpha7]=imread('smoke3.png');
[smoke4,map,alpha8]=imread('smoke4.png');
[smoke5,map,alpha9]=imread('smoke5.png');
[smoke6,map,alpha10]=imread('smoke6.png');
[smoke7,map,alpha11]=imread('smoke7.png');
[smoke8,map,alpha12]=imread('smoke8.png');
[smoke9,map,alpha13]=imread('smoke9.png');
[smoke10,map,alpha14]=imread('smoke10.png');
sm={smoke1,smoke2,smoke3,smoke4,smoke5,smoke6,smoke7,smoke8,smoke9,smoke10};
global smokesp;
smokesp=zeros(10,1);
for a=1:10
    smokesp(a)=image(sm{a});
end
%smoke pos
for c=1:10
    set(smokesp(c),'ydata',[0 0.001]);
    set(smokesp(c),'xdata',[0 0.001]);
end
al={alpha5,alpha6,alpha7,alpha8,alpha9,alpha10,alpha11,alpha12,alpha13,alpha14};
for z=1:10
    set(smokesp(z),'alphadata',al{z});
end
%car initial pos
startimage=imread('start.jpg');
start=image(startimage);
set(start,'xdata',[-32.25 -28.25]);
set(start,'ydata',[-9 9]);
h=text(-30,-4,'START','fontsize',10);
A=text(-64,-2,'PRESS SpaceBar To RESTART OR esc to EXIT.','fontsize',0.0001,'color','r');
L=text(-64,10,'YOU LOSE!','fontsize',0.001,'color','r');
set(h, 'rotation',90)
[car2,map,alpha]=imread('car2.png');
car=image(car2);
a=fliplr(car2);
b=rot90(car2,-1);
c=rot90(car2);
lrcar=image(a);
ucar=image(b);
dcar=image(c);
set(car,'alphadata',alpha);
set(lrcar,'alphadata',alpha);
set(car,'xdata',[0 0.0001]);
set(car,'ydata',[0 0.0001]);
set(lrcar,'xdata',[0 0.0001]);
set(lrcar,'ydata',[0 0.0001]);
set(ucar,'xdata',[0 0.0001]);
set(ucar,'ydata',[0 0.0001]);
set(dcar,'xdata',[0 0.0001]);
set(dcar,'ydata',[0 0.0001]);
%%
w=32;
while w~=27 && w==32
     set(L, 'fontsize',0.0001)
     set(A,'fontsize',0.0001)
    promptdif = ('Choose Difficulty (e=easy,m=medium,h=hard)');
    dif=inputdlg(promptdif);
    if strcmp(dif,'h')==1
        LIFE=4;
        topsp=178;
    elseif strcmp(dif,'m')==1
        LIFE=7;
        topsp=160;
    else
        LIFE=10;
        topsp=135;
    end
    set(A,'fontsize',0.0001)
    ix=-29;
    iy=0;
    speedcol=topsp*0.20;
    speed=topsp;
    set(car,'alphadata',alpha);
    set(lrcar,'alphadata',alpha);
    set(car,'xdata',[ix ix+6]);
    set(car,'ydata',[iy iy+4]);
    set(lrcar,'xdata',[ix ix+2]);
    set(lrcar,'ydata',[iy iy+2]);
    set(ucar,'xdata',[ix ix+2]);
    set(ucar,'ydata',[iy iy+2]);
    set(dcar,'xdata',[ix ix+2]);
    set(dcar,'ydata',[iy iy+2]);
    title('CLICK TO START')
    axis ([-150 100 -150 50]);
    set(image1,'ydata',[-150 50]);
    set(image1,'xdata',[-150 100]);
    [x,y]=ginput(1);
    clear sound
    
    for z=3:-1:1
        title(num2str(z))
        t1=text(-45,-42,num2str(z),'fontsize',70,'color','r');
        [q,Fs] = audioread('beep.wav');
        sound(q,Fs);
        pause(1);
        set(t1, 'fontsize',0.001);
    end
    
    title('GO!');
    a=text(-75,-42,'START','fontsize',42,'color','g');
    [q,Fs] = audioread('beep.wav');
    sound(q,Fs)
    pause(0.5)
    set(a, 'fontsize',0.001)
    tic;
    [q,Fs] = audioread('back.mp3');
    sound(q,Fs)
    %continue to move in the direction of the pointer until their pos matches.
    X=0;
    while X~=-32
        distance=sqrt(((y - iy)^2)+((x - ix)^2));
        time=distance/speed;
        grad=(y-iy)/(x-ix);
        deltaX=(abs(x-ix)/time)*0.01;
        deltaY=(abs(y-iy)/time)*0.01;
        if ix-x<0
            X=ix+deltaX;
            Y=grad*(X-ix)+iy;
        elseif ix-x>0
            X=ix-deltaX;
            Y=grad*(X-ix)+iy;
        elseif ix-x ==0 && y-iy>0
            Y=iy+deltaY;
            X=ix;
        elseif ix-x ==0 && y-iy<0
            Y=iy-deltaY;
            X=ix;
        end
        %% calling track equations
        [yup,ylow,xrange]=horizontaleq(X,-70,-10,10,-10);%horizontaleq(x,xa,xb,ya,yb)
        [yup1,ylow1,xrange1]=uptilteq(X,-10,30,10,-10);%uptilteq(x,xa,xb,ya,yb)
        [yup2,xrange2]=circleseceq(X,30,10,30,50,0);%circleseceq(x,h,k,xa,xb,inverse(1=yes,0=no)) radius=20)
        [xmax,xmin,xrange3] =verticleeq(30,50);%verticleeq(x1start,x2start) radius=20
        [yright,yleft,xrange4]=righttilteq(X,30,-30,50,-30);%righttilteq(x,xleftstart,yleftstart,xrightstart,yrightstart)
        [xmax2,xmin2,xrange5] =verticleeq(50,70);%verticleeq(x1start,x2start)
        [yup3,xrange6]=circleseceq(X,50,-100,50,70,1);%circleseceq(x,h,k,xa,xb,inverse(1=yes,0=no)) radius=20)
        [yup4,ylow4,xrange7]=horizontaleq(X,-100,50,-100,-120);%horizontaleq(x,xa,xb,ya,yb)
        [yup5,xrange8]=circleseceq(X,-100,-100,-100,-120,1);%circleseceq(x,h,k,xa,xb,inverse(1=yes,0=no)) radius=20)
        [xmax3,xmin3,xrange9] =verticleeq(-120,-100);%verticleeq(x1start,x2start)
        [yup6,xrange10]=circleseceq(X,-100,-90,-100,-120,0);%circleseceq(x,h,k,xa,xb,inverse(1=yes,0=no)) radius=20)
        [yup7,ylow7,xrange11]=horizontaleq(X,-100,-90,-70,-90);%horizontaleq(x,xa,xb,ya,yb)
        [xmax4,xmin4,xrange12] =verticleeq(-90,-70);%verticleeq(x1start,x2start)
        [yup8,xrange13]=circleseceq(X,-90,-70,-90,-70,1);%circleseceq(x,h,k,xa,xb,inverse(1=yes,0=no)) radius=20)
        [yup9,xrange14]=circleseceq(X,-70,-10,-70,-90,0);%circleseceq(x,h,k,xa,xb,inverse(1=yes,0=no)) radius=20)
        %%
        %KEEPING CAR ON TRACK
        %Keeping car in horizontal section.
        if X>75
            X=50;
        elseif X>xrange(1) && X<=xrange(2) && Y>-12 && Y<12
            if X<=-30 && x<X
                X=-27;
            end
            if X>=-32 && X<-30 && x>X
                X=-32;
            end
            if Y+4>yup
                Y=yup-4;
                speed=speedcol;
                LIFE=smokefunc(X,X+8,Y+2,Y+10,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
            elseif Y<ylow
                Y=ylow;
                speed=speedcol;
                LIFE=smokefunc(X,X+8,Y+2,Y-6,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
            else
                speed=topsp;
            end
            %keeping car in uptilit section.
        elseif X>xrange1(1) && X<=xrange1(2) && (abs(Y-ylow1)<1 || abs((Y+2)-yup1)<1)
            if Y+4>yup1
                Y=yup1-4;
                speed=speedcol;
                LIFE=smokefunc(X,X+8,Y+2,Y+10,LIFE);
                if LIFE==0
                    Y=0;
                    X=-32;
                end
            elseif Y-2<ylow1
                Y=ylow1+2;
                speed=speedcol;
                LIFE=smokefunc(X,X+8,Y+2,Y-8,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
            else
                speed=topsp;
            end
            %keeping car in circle section.
        elseif X>xrange1(2) && (X<xrange2(2)+2) &&Y>10 &&Y<32
            if Y+4>yup2
                Y=yup2-4;
                speed=speedcol;
                LIFE=smokefunc(X,X+8,Y+2,Y+10,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
            end
            if X+6>xrange2(2)
                X=xrange2(2)-6;
                LIFE=smokefunc(X+2,X+8,Y-3,Y+7,LIFE);
                Y=0;
            else
                speed=topsp;
            end
            %keeping car in verticle section.
        elseif Y<=10 && Y>=-30 && X>=(xrange3(1))-1 && X<=(xrange3(2)+1);
            if X<xmin
                X=xmin;
                speed=speedcol;
                LIFE=smokefunc(X,X-6,Y-3,Y+7,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
            elseif X+4>xmax
                X=xmax-4;
                speed=speedcol;
                LIFE=smokefunc(X,X+8,Y-3,Y+7,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
            else
                speed=topsp;
            end
            %keeping car in righttilt section.
        elseif X>=xrange4(1) && X<xrange4(2) &&Y<-28 && Y>=-50
            if Y+6>yright
                Y=yright-6;
                speed=speedcol;
                LIFE=smokefunc(X,X+8,Y-2,Y+8,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
            elseif Y<yleft
                Y=yleft;
                speed=speedcol;
                LIFE=smokefunc(X,X-6,Y-2,Y+8,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
            else
                speed=topsp;
            end
            %keeping car in verticle2 section.
        elseif X+4>xrange5(2) && (X<xrange5(2)+4) && Y>-105 && Y<-95
            X=xrange5(2)-4;
            speed=speedcol;
            LIFE=smokefunc(X,X+8,Y-2,Y+8,LIFE);
            if LIFE==0
                X=-32;
                Y=0;
            end
        elseif Y<-50 && Y>=-100 && X>=(xrange5(1))-1 && X<=(xrange5(2)+1);
            if X<xmin2
                X=xmin2;
                speed=speedcol;
                LIFE=smokefunc(X,X-8,Y-2,Y+8,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
            elseif X+4>xmax2
                X=xmax2-4;
                speed=speedcol;
                LIFE=smokefunc(X,X+8,Y-2,Y+8,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
            else
                speed=topsp;
            end
            %keeping car in circle2 section.
        elseif X>xrange6(1) && (X<xrange6(2)+2) &&Y>-122 &&Y<-100
            if Y<yup3
                Y=yup3+3;
                X=X-2;
                speed=speedcol;
                LIFE=smokefunc(X,X+8,Y-4,Y+6,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
                if X+4>xrange6(2)
                    X=xrange6(2)-4;
                    speed=speedcol;
                    LIFE=smokefunc(X+2,X+8,Y-2,Y+8,LIFE);
                    if LIFE==0
                        X=-32;
                        Y=0;
                    end
                end
            else
                speed=topsp;
            end
            %Keeping car in horizontal2 section.
        elseif X>xrange7(1) && X<=xrange7(2) && Y>-122 && Y< -98
            if Y+4>yup4
                Y=yup4-4;
                speed=speedcol;
                LIFE=smokefunc(X,X+8,Y+2,Y+10,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
            elseif Y<ylow4
                Y=ylow4;
                speed=speedcol;
                LIFE=smokefunc(X+4,X-4,Y+2,Y-6,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
            else
                speed=topsp;
            end
            %keeping car in circle3 section.
        elseif X>(xrange8(2)-2) && X<xrange8(1) &&Y>-122 &&Y<=-104
            if Y<yup5
                Y=yup5;
                speed=speedcol;
                LIFE=smokefunc(X+2,X-8,Y-2,Y+7,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
                if X<xrange8(2)
                    X=xrange8(2);
                    speed=speedcol;
                    LIFE=smokefunc(X+2,X-8,Y-2,Y+8,LIFE);
                    if LIFE==0
                        X=-32;
                        Y=0;
                    end
                end
            else
                speed=topsp;
            end
            %keeping car in verticle3 section.
        elseif Y>-101 && Y<=-90 && X>=xrange9(1) && X<=xrange9(2);
            if X<xmin3
                X=xmin3;
                speed=speedcol;
                LIFE=smokefunc(X,X-8,Y+2,Y+10);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
            elseif X+4>xmax3
                X=xmax3-4;
                speed=speedcol;
                LIFE=smokefunc(X,X+8,Y+2,Y+10,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
            else
                speed=topsp;
            end
            %keeping car in circle4 section.
        elseif X<xrange10(2) && (X>xrange10(2)-4) && Y>-120 && Y<-85
            X=xrange10(2)+1;
            speed=speedcol;
            LIFE= smokefunc(X+1,X-8,Y-2,Y+8,LIFE);
            if LIFE==0
                X=-32;
                Y=0;
            end
        elseif X>xrange10(2) && X<xrange10(1) &&Y>-88 &&Y<-70
            if Y+4>yup6
                Y=yup6-4;
                speed=speedcol;
                LIFE=smokefunc(X,X+8,Y+2,Y+10,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
                if X<=xrange10(2)
                    X=xrange10(2);
                    speed=speedcol;
                    LIFE=smokefunc(X,X-8,Y+2,Y+10,LIFE);
                    if LIFE==0
                        X=-32;
                        Y=0;
                    end
                end
            else
                speed=topsp;
            end
            %Keeping car in horizontal3 section.
        elseif X>=xrange10(1) && X<=xrange11(2) && Y>-94 && Y< -69
            if Y+4>yup7
                Y=yup7-4;
                speed=speedcol;
                LIFE=smokefunc(X,X+8,Y+2,Y+10,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
            elseif Y<ylow7
                Y=ylow7;
                speed=speedcol;
                LIFE=smokefunc(X,X+8,Y+2,Y-8,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
            else
                speed=topsp;
            end
            %keeping car in verticle4 section.
        elseif X+4>xrange12(2) && (X<xrange12(2)+4) && Y>-76 && Y<-65
            X=xrange12(2)-4;
            speed=speedcol;
            LIFE=smokefunc(X,X+8,Y+2,Y+10,LIFE);
            if LIFE==0
                X=-32;
                Y=0;
            end
        elseif Y>-69 && Y<=-10 && X>=(xrange12(1)-1) && X<=xrange12(2);
            if X<xmin4
                X=xmin4;
                speed=speedcol;
                LIFE=smokefunc(X+2,X-8,Y+2,Y+10,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
            elseif X+4>xmax4
                X=xmax4-4;
                speed=speedcol;
                LIFE=smokefunc(X,X+8,Y+2,Y+10,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
            else
                speed=topsp;
            end
            %keeping car in circle5
        elseif X>xrange13(1) && (X<xrange13(2)+2) &&Y>-92 &&Y<-70
            if Y-2<yup8
                Y=yup8+2;
                X=X-2;
                speed=speedcol;
                LIFE=smokefunc(X,X+8,Y+2,Y-8,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
                if X+4>xrange13(2)
                    X=xrange13(2)-4;
                    speed=speedcol;
                    LIFE=smokefunc(X,X+8,Y+2,Y+8,LIFE);
                    if LIFE==0
                        X=-32;
                        Y=0;
                    end
                end
            else
                speed=topsp;
            end
            %keeping car in circle6
        elseif X<xrange14(2) && X>(xrange14(2)-4) && Y>-11 && Y<5
            X=xrange14(2)+1;
            speed=speedcol;
            LIFE=smokefunc(X,X+8,Y+2,Y+10,LIFE);
            if LIFE==0
                X=-32;
                Y=0;
            end
        elseif X>(xrange14(2)-1) && X<xrange14(1) &&Y>-10 &&Y<10
            if Y+4>yup9
                Y=yup9-4;
                speed=speedcol;
                LIFE=smokefunc(X,X+8,Y+2,Y+10,LIFE);
                if LIFE==0
                    X=-32;
                    Y=0;
                end
                if X<=xrange14(2)
                    X=xrange14(2);
                    speed=speedcol;
                    LIFE=smokefunc(X,X-8,Y+2,Y+10,LIFE);
                    if LIFE==0
                        X=-32;
                        Y=0;
                    end
                end
            else
                speed=topsp;
            end
        else
            speed=topsp;
        end
        
        %UPDATING CAR POSITION
        
        iy=Y;
        ix=X;
        axis ([X-35 X+35 Y-35 Y+35]);
        set(image1,'ydata',[Y-35 Y+35]);
        set(image1,'xdata',[X-35 X+35]);
        angle=abs(atand((y-Y)/(x-X)));
        if angle>=45
            if y-Y>0
                set(ucar,'xdata',[X X+4]);
                set(ucar,'ydata',[Y Y+6]);
                set(dcar,'xdata',[0 0.001]);
                set(dcar,'ydata',[0 0.001]);
                set(lrcar,'xdata',[0 0.001]);
                set(lrcar,'ydata',[0 0.001]);
                set(car,'xdata',[0 0.001]);
                set(car,'ydata',[0 0.001]);
            else
                set(dcar,'xdata',[X X+4]);
                set(dcar,'ydata',[Y Y+6]);
                set(ucar,'xdata',[0 0.001]);
                set(ucar,'ydata',[0 0.001]);
                set(lrcar,'xdata',[0 0.001]);
                set(lrcar,'ydata',[0 0.001]);
                set(car,'xdata',[0 0.001]);
                set(car,'ydata',[0 0.001]);
            end
        elseif x<X
            set(lrcar,'xdata',[X X+6]);
            set(lrcar,'ydata',[Y Y+4]);
            set(dcar,'xdata',[0 0.001]);
            set(dcar,'ydata',[0 0.001]);
            set(ucar,'xdata',[0 0.001]);
            set(ucar,'ydata',[0 0.001]);
            set(car,'xdata',[0 0.001]);
            set(car,'ydata',[0 0.001]);
            
        else
            set(car,'xdata',[X X+6]);
            set(car,'ydata',[Y Y+4]);
            set(dcar,'xdata',[0 0.001]);
            set(dcar,'ydata',[0 0.001]);
            set(ucar,'xdata',[0 0.001]);
            set(ucar,'ydata',[0 0.001]);
            set(lrcar,'xdata',[0 0.001]);
            set(lrcar,'ydata',[0 0.001]);
        end
        pause(0.01);
        
        %To pause game.
        
        P= get(gcf, 'CurrentCharacter');
        p=double(P);
        if p==112
            waitforbuttonpress
        end
        
        ti=toc;
        if toc>=44
            [q,Fs] = audioread('back.mp3');
            sound(q,Fs)
        end
        title(['TIME:',num2str(toc),'s            LIFE=',num2str(LIFE)])
        set (gcf, 'WindowButtonMotionFcn', @move);
        C=move;
        x=C(1,1);
        y=C(1,2);
        
        %WIN-LOSE CONDITIONS
        
        if X==-32 && Y>-12 && Y<12
            if LIFE==0
                clear sound
                [q,Fs] = audioread('failSound.wav');
                sound(q,Fs)
                title(gca,'YOU LOSE!')
                set(L, 'fontsize',42)
                set(A,'fontsize',11)
                waitforbuttonpress
                W= get(gcf, 'CurrentCharacter');
                w=double(W);
                clear sound
            else
                title(gca,['YOUR LAP TIME! ',num2str(ti),'s'])
                [q,Fs] = audioread('Winning.wav');
                sound(q,Fs)
                prompt = ('Enter name');
                name1=inputdlg(prompt);
                ranktable(name1,ti)
                set(A,'fontsize',11)
                waitforbuttonpress
                W= get(gcf, 'CurrentCharacter');
                w=double(W);
                clear sound
            end
        end
    end
end
close all
clear all
end


function [C]= move(object, eventdata)

C = get (gca, 'CurrentPoint');
%title(gca, ['(X,Y) = (', num2str(C(1,1)), ', ',num2str(C(1,2)), ')']);
end