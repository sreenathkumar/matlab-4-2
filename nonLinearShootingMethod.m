function [guesses, Y] = nonLinearShootingMethod(func, x_initial, x_final, y_initial, y_final, guesses, increment)
n = length(x_initial : increment : x_final);
for i = 1 : length(guesses)
Y(i, :) = eulersMethod(func, x_initial, x_final, y_initial, guesses(i), increment);
if(((round(Y(i, n)*10^4))/(10.^4))-y_final == 0)
    fprintf('Solution at Guess: %.4f', guesses(i));
    break;
end
end
while(1)
i = length(guesses)+1;
guesses(i) = secantFormula(i, guesses, y_final, Y);
Y(i, :) = eulersMethod(func, x_initial, x_final, y_initial, guesses(i), increment);
if(((round(Y(i, n)*10^4))/(10.^4))-y_final == 0)
    fprintf('Solution at Guess: %.4f', guesses(i));
    break;
end
end
guesses = guesses';
function Y = eulersMethod(func, x_initial, x_final, y_initial, z_initial, increment)
X = x_initial : increment : x_final; Y = y_initial; Z = z_initial;
for j = length(Y)+1 : length(X)
    Y(j) = Y(j-1) + increment*Z(j-1);
    Z(j) = Z(j-1) + increment*func(X(j-1), Y(j-1), Z(j-1));
end
end
end
% f=@(x, y, z) 6*y^2-x;
% g=[1.2, 1.5];
% [X, Y]= nonLinearShootingMethod(f, 0, 1, 1, 5, g, 1/3);
% disp([X', Y]);
% 0<=x<=1 with y(0)=1, y(1)=5, h=1/3