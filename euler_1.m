%Use the euler forward difference method to solve the following equation
%and plot it alongside with the analytical result.Let the step size h=0.1
%and number of steps N=30 dy/dx=-2y,y(0)=3
clc 
clear all;
close;
h=0.1;
N=30;
y(1)=3;
for i=1:N
    y(i+1)=y(i)+h*(-2*y(i));
    x(i+1)=i*h;
end
plot(x,y,'b','linewidth',2.5);
hold on;
x=0:h:h*N;
ya=3*exp(-2.*x);
plot(x,ya,'r','linewidth',2.5);
xlabel('x');
ylabel('y(x)');
legend('Euler Fd','Analytical');
