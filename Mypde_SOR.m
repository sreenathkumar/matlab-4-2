%================================================================
%Solution of the PDE[Uxx+Uyy=2] with the following conditions:
% (i)Initial Condition: U=1; 0<x<1 and 0<y<1
% (ii)Boundary Condition: U=0 at x=0,1 and y=0,1
%Solve the problem with step size h=0.1
%================================================================
function u_val=Mypde_SOR(a,b,n,w,N)
%d is the duffision parameter
%dt is the time increment
%n is the step number
%N is the number of iteration
%T is the final time

clc
h=(b-a)/n;
x=a+[0:n]*h;
y=a+[0:n]*h;

u_old=ini(x,y,n);

M=Matrix_M(n);

D=Matrix_D(n);
L=Matrix_L(n);
U=Matrix_U(n);
M==D-L-U;

inv_D=inv(D);
P1=eye((n-1)^2)-w*inv_D*L;
P=inv(P1);
Q=(1-w)*eye((n-1)^2)+w*inv_D*U;
S=P*Q;
c1=2*h^2;
c=c1*ones((n-1)^2,1);

bdv1=vec_1(a,b,n);
bdv2=vec_2(a,b,n);

d=c-(bdv1+bdv2);
u_old1=u_old(2:n,2:n)';
u_old1=u_old1';
u_old1=u_old1(:);

for iteration=i:N
    u_new1=S*u_old1+P*(w*inv_D*d);
    u_old1=u_new1;
end

u_new1=u_old1;

u_val_sq=u_new1(1:(n-1),1)';

for k=2:(n-1)
    u_val_sq=[u_val_sq;u_new1((k-1)*(n-1)+1:k*(n-1),1)'];
end

u_val=u_val_sq;
