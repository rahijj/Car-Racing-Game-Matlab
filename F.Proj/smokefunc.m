function [Life] = smokefunc(x1,x2,y1,y2,l)
%WHEN Function is called sprites of smoke is generated.
%   The first four parameters passed to the smokefunc function specify the
%   coordinates of the position where the smoke is generated
global smokesp
    [q,Fs] = audioread('smashsound.wav');
    sound(q,Fs)
for i=1:10

    set(smokesp(i),'ydata',[y1 y2]);
    set(smokesp(i),'xdata',[x1 x2]);
    pause(0.01)
    set(smokesp(i),'ydata',[0 0.0001]);
    set(smokesp(i),'xdata',[0 0.0001]);
end
% This reduces the LIFE by '1' whenever the car hits the wall.
Life=l-1;
end

