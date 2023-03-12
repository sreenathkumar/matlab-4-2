function Y = heunsFormula(func, x_initial, x_final, y_initial, z_initial, increment, temp)
X = x_initial : increment : x_final; Y = y_initial; Z = z_initial;
for i = length(Y)+1 : length(X)
    k1 = increment*Z(i-1);
    k2 = increment*func(X(i-1), Y(i-1), Z(i-1), temp);
    k3 = increment*(Z(i-1) + k2);
    k4 = increment*func(X(i), Y(i-1)+k1, Z(i-1)+k2, temp);
    Y(i) = Y(i-1) + (k1+k3)/2;
    Z(i) = Z(i-1) + (k2+k4)/2; 
end
end
% Modified Eulerd Method for IVP