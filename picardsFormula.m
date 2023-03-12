function Y = picardsFormula(func, x_initial, x_final, y_initial, increment)
syms x
X = x_initial : increment : x_final; Y(1) = y_initial;
g(x) = y_initial + int(func(x, y_initial), x, x_initial, x);
for i = 2 : length(X)
    Y(i) = round(g(X(i))*10.^2)/(10.^2);
end
end