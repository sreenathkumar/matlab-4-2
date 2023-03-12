function x = standardFivePointFormula(i,j, Matrix)
x = (1/4)*(Matrix(i-1, j) + Matrix(i+1, j) + Matrix(i, j-1) + Matrix(i, j+1));
end