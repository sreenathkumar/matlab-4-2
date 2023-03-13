%Solution Of the ODE[D(DY)=(-2/x*x)Dy+(2/x*x)y+sin(log(x))/x*x] with
%Boundary Condition:y(1),y(2)=2.Solve The problem by using finite
%difference method with h=0.1
function y_new=Mypde(a,b,alfa,beta,h)

clc
clear all
a=1;
b=2;
alfa=1;
beta=2;
N=10;

h=(b-a)/N;
x=a+[0:N]*h;
p=inline('-2/x');
q=inline('2/(x*x)');
r=inline('sin(log(x))/(x*x)');
y_new(1)=alfa;
y_new(N+1)=beta;

for i=1:N
    a1(i)=-1-(h/2)*p(x(i));
    b1(i)=2+(h*h)*q(x(i));
    c1(i)=-1+(h/2)*p(x(i));
    d1(i)=-(h*h)*r(x(i));
end

d1(1)=-(h*h)*r(x(1))-a1(1)*alfa;
d1(N)=-(h*h)*r(x(N))-c1(N)*beta;

A(1)=b1(1);
B(1)=d1(1);

for i=2:1:N
    A(i)=b1(i)-(a1(i)/A(i-1))*c1(i-1);
end

for i=2:1:N
    B(i)=d1(i)-(a1(i)/A(i-1))*B(i-1);
end

y_new(N)=B(N)/A(N);
y_old=y_new;

for i=N-1:-1:2
    y_new(i)=(B(i)-c1(i-1)*y_old(i+1))/A(i);
    y_old=y_new;
end

n=length(y_new);
n1=length(x);

plot(x,y_new)