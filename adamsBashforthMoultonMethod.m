
function C = adamsBashforthMoultonMethod(func, x_initial, x_final, y_initial, increment)

X = x_initial : increment : x_final;
Y = RK4(func, x_initial, x_final-increment, y_initial, increment);
P = Y; C = Y;
P(length(P)+1) = abPredictor(length(P), func, X, C, increment);
C(length(C)+1) = amCorrector(length(C), func, X, P, increment);
    function y = abPredictor(n, f, X, Y, h)
        y = Y(n) + ((h/24) * (55*f(X(n), Y(n)) - 59*f(X(n-1), Y(n-1)) + 37*f(X(n-2), Y(n-2)) - 9*f(X(n-3), Y(n-3))));
    end
    function y = amCorrector(n, f, X, Y, h)
        y = Y(n) + ((h/24) * (9*f(X(n+1), Y(n+1)) + 19*f(X(n), Y(n)) - 5*f(X(n-1), Y(n-1)) + f(X(n-2), Y(n-2))));
    end
end
