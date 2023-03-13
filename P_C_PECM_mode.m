%Solve The IVP Dy=y-x^2,y(0)=1,by using P_C_method in P(EC)^m mode with
%h=0.1,where D is the differential operator with respect to x.
function y_c=P_C_PECM_mode(a,h,n,y0,M)
clc
clear all
x=a:h:n*h;

f=inline('y-x^2');

for i=1:1:3
    y_p=R_K_method(a,h,n,y0,f)
    f_eva(i)=f(x(i),y_p(i));
end
 y_c=y_p;
 
 for i=3:1:n
     y_p(i+1)=y_p(i)+(h/12)*(23*f_eva(i)-16*f_eva(i-1)+5*f_eva(i-2));
     for m=1:1:M
         f_eva(i+1)=f(x(i+1),y_p(i+1));
         y_c(i+1)=y_p(i)+(h/12)*(5*f_eva(i)-f_eva(i-1));
         y_p=y_c;
     end
     
     y_exact=-exp(x)+x.^2+2*x+2;
     plot(x,y_c,'r-*',x,y_exact,'g')