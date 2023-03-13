

clc
clear all
clear figure

a=1;
b=2;
alfa=1;
beta=2;
x(1)=a;
u1(1)=alfa;
u2(1)=0;
v1(1)=0;
v2(1)=1;
h=0.1;
n=(b-a)/h;
x=a+[0:n]*h;

f1=inline('0*x+0*u1+u2');
f2=inline('-(2/x)*u2+(-2/(x*x))*u1+sin(log(x))/(x*x)');
g1=inline('0*x+0*v1+v2');
g2=inline('-(2/x)*v2+(-2/(x*x))*v1');

for i=1:1:n+1
    k(1,1)=h*f1(u1(i),u2(i),x(i));
    k(1,2)=h*f2(u1(i),u2(i),x(i));
    
    k(2,1)=h*f1(u1(i)+(1/2)*k(1,1),u2(i)+(1/2)*k(1,2),x(i)+(h/2));
    k(2,2)=h*f2(u1(i)+(1/2)*k(1,1),u2(i)+(1/2)*k(1,2),x(i)+(h/2));
    
    k(3,1)=h*f1(u1(i)+(1/2)*k(2,1),u2(i)+(1/2)*k(2,2),x(i)+(h/2));
    k(3,2)=h*f2(u1(i)+(1/2)*k(1,1),u2(i)+(1/2)*k(1,2),x(i)+(h/2));
    
    k(4,1)=h*f1(u1(i)+k(3,1),u2(i)+k(3,2),x(i)+h);
    k(4,2)=h*f2(u1(i)+k(3,1),u2(i)+k(3,2),x(i)+h);
    
    u1(i+1)=u1(i)+(1/6)*(k(1,1)+2*k(2,1)+2*k(3,1)+k(4,1));
    u2(i+1)=u2(i)+(1/6)*(k(1,2)+2*k(2,1)+2*k(3,2)+k(4,2));
    
end

    
    