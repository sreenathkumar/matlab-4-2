function Y = linearShootingMethod(func, x_initial, x_final, y_final, increment)
U = heunsFormula(func, x_initial, x_final, 1, 0, increment, 1);
V = heunsFormula(func, x_initial, x_final, 0, 1, increment, 0);
for i = 1 : length(U)
    Y(i) = shootingMethod(i, U, V, y_final);
end
    function y = shootingMethod(n, U, V, b)
        y = U(n) + ((b-U(length(U)))/V(length(V))) * V(n);
    end
end
% u=@(x, y, z, k) (((-2*z)/x)+((2*y)/x.^2)+(sin(log(x))/x.^2)*k);
% linearShootingMethod(u, 1, 2, 2, .2)
% 1<=x<=2 with y(1)=1 and y(2)=2
% x_initial=1, x_final=2, y_initial or a=1, y_final or b=2, increment or h=.2