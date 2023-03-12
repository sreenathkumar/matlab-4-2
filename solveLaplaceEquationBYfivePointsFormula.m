clear all
clc
% Table
m = input("Enter Number of Rows: ");
n = input("Enter Number of Columns: ");
Z = zeros(m, n);
Z(1, :) = input("Enter first row members: ");
Z(m, :) = input("Enter final row members: ");
Z(:, 1) = input("Enter first column members: ");
Z(:, n) = input("Enter final column members: ");
i = input("Enter Number of Iteration: ");
for iteration = 1 : i
for r = n-1 : -1 : 2
    for c = 2 : n-1
        Z(r, c) = standardFivePointFormula(r, c, Z);
    end
end
values = Z(4:-1:2, 2:4);
values = values';
values = values(:)';
newMat(iteration, :) = values;
end
disp(newMat)
% m = 5;
% n = 5;
% Z(1, :) = [1, 1, 1, 1, 1];
% Z(m, :) = [0, 0, 0, 0, 0];
% Z(:, 1) = [0, 0, 0, 0, 0];
% Z(:, n) = [0, 0, 0, 0, 0];