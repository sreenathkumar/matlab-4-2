clc
clear all;
x0=0;
xf=2;
y0=1;
h=0.1;
N=(xf-x0)/h;
x=x0:h:xf;
y=[y0 zeros(1,N)];
for k=1:5
    for n=1:N
        y(n+1)=(y(n)+h*(k+x(n+1)))/(1+h);
    end
    plot(x,y,'b','linewidth',2.5);
    xlabel('x');
    ylabel('y');
    legend('k=1','k=2','k=3','k=4','k=5');
    hold on;
end