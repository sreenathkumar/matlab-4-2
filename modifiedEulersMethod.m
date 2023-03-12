function Y = modifiedEulersMethod(func, x_initial, x_final, y_initial, increment)
X = x_initial : increment : x_final;
Y = eulersMethod(func, x_initial, x_final, y_initial, increment);
for i = 2 : length(X)
    while(1)
        temp = Y(i);
        Y(i) = Y(i-1) + (increment/2)*(func(X(i-1), Y(i-1)) + func(X(i), Y(i)));
        if(abs(temp-Y(i)) <= .0001)
            break;
        end
    end
end
end
% f = @(x, y) (x.^2 + y);
% modifiedEulersMethod(f, 0, .5, 1, .1)