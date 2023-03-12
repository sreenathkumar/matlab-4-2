function [Y, Z] = RK4forSimultaneousDE(function_1, function_2, x_initial, x_final, y_initial, z_initial, increment)
X= x_initial : increment : x_final; Y= y_initial; Z= z_initial;
for i= 1 : length(X)-1
    k1= increment * function_1(X(i), Y(i), Z(i));
    l1= increment * function_2(X(i), Y(i), Z(i));
    k2= increment * function_1(X(i)+(increment/2), Y(i)+(k1/2), Z(i)+(l1/2));
    l2= increment * function_2(X(i)+(increment/2), Y(i)+(k1/2), Z(i)+(l1/2));
    k3= increment * function_1(X(i)+(increment/2), Y(i)+(k2/2), Z(i)+(l2/2));
    l3= increment * function_2(X(i)+(increment/2), Y(i)+(k2/2), Z(i)+(l2/2));
    k4= increment * function_1(X(i)+increment, Y(i)+k3, Z(i)+l3);
    l4= increment * function_2(X(i)+increment, Y(i)+k3, Z(i)+l3);
    Y(i+1)= Y(i) + (1/6)*(k1+2*k2+2*k3+k4);
    Z(i+1)= Z(i) + (1/6)*(l1+2*l2+2*l3+l4);
end
end
% f=@(x, y, z) x+z;
% g=@(x, y, z) x-y^2;
% [Y, Z] = RK4forSimultaneousDE(f, g, 0, .1, 2, 1, .1)