function y = secantFormula(n, R, y_final, Y)
m = length(Y);
y = R(n-1) + ((y_final-Y(n-1, m))/(Y(n-1, m)-Y(n-2, m)))*(R(n-1)-R(n-2));
end