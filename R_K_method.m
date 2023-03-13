%Solve the IVP Dy=y-x^2,y(0)=1,by using 4-order Runge-Kutta Method with
%h=0.1, Where D is the differential operator with respect to x.
function y_p=R_K_method(a,h,n,y0,f)
x=a:h:n*h;
f=inline('y-x^2');
format short
y_p(1)=y0;

for i=1:1:n
    k1=f(x(i)+(1/2)*h,y_p(i));
    k2=f(x(i)+(1/2)*h,y_p(i)+(1/2)*h*k1);
    k3=f(x(i)+(1/2)*h,y_p(i)+(1/2)*h*k2);
    k4=f(x(i)+h,y_p(i)+h*k2);
    y_p(i+1)=y_p(i)+(h/6)*(k1+2*k2+2*k3+k4);
end
