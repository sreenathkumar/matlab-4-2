function Y = eulersMethod(func, x_initial, x_final, y_initial, increment)
X = x_initial : increment : x_final; Y = y_initial;
for i = length(Y)+1 : length(X)
    Y(i) = Y(i-1) + increment*func(X(i-1), Y(i-1));
end
end
% f = @(x, y) ((y - x) / (y + x));
% eulersMethod(f, 0, .5, 1, .1)