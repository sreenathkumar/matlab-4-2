clc
clear all
theta=0:pi/36:2*pi;
R=cos(theta)-1;
I=sin(theta);
plot(R,I,'k','linewidth',2.5);
axis('square');
grid;
ylabel('Im (Lh)');
xlabel('Re (Lh)');