function C = milnesMethod(func, x_initial, y_initial, increment, initial_range, final_range)
X = x_initial : increment : final_range;
Y = picardsFormula(func, x_initial, initial_range-increment, y_initial, increment);
for i = 1 : length(Y)
    F(i) = round(func(X(i), Y(i))*10.^4)/(10.^4);
end
P = Y; C = Y;
for i = length(Y) : length(X)-1
    [P(i+1), F(i+1)] = milnesPredictor(i, func, X, C, F, increment);
    [C(i+1), F(i+1)] = milnesCorrector(i, func, X, P, F, increment);
    temp = F(i+1);
    while(1)
        [C(i+1), F(i+1)] = milnesCorrector(i, func, X, C, F, increment);
        if(temp == F(i+1))
            break;
        end
        temp = F(i+1);
    end
end
    function [y, f] = milnesPredictor(n, f, X, Y, F, h)
        y = round((Y(n-3) + ((4*h)/3)*(2*F(n-2)-F(n-1)+2*F(n)))*10^4)/(10.^4);
        f = round(f(X(n+1), y)*10^4)/(10.^4);
    end
    function [y, f] = milnesCorrector(n, f, X, Y, F, h)
        y = round((Y(n-1) + (h/3)*(F(n-1)+4*F(n)+F(n+1)))*10^4)/(10.^4);
        f = round(f(X(n+1), y)*10^4)/(10.^4);
    end
end
% f=@(x, y) (x^2+y^2)/10;
% milnesMethod(f, 0, 1, .1, .5, 1)
% y(0)=1 with .5<=x<=1