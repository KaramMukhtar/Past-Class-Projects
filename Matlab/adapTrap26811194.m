function Value = adapTrap26811194(f,a,b,e)
%part #1: trapezoidal rule
N = 2;
r = zeros(N);
iter = 0;
while iter < N
    n = 2^iter;
    r_one = 0;
    h = (b - a) / n;
    k = a;
    while (k + h) <= b
        r_one = r_one + ((h / 2) * (f(k) + f(k + h)));
        k = k + h;
    end
    r(iter + 1, 1) = r_one;
    iter = iter + 1;
end
column = 2;
while column <= N
   row = column;
   while row <= N
       r(row,column) = r(row, column - 1) + (1 / ((4^(column - 1)) - 1)) * (r(row, column - 1) - r(row - 1, column - 1));
       row = row + 1;
   end
   column = column + 1;
end

%Part #2: adaptive quadrature
if (1/3 * (abs(r(1,1) - (r(2,1))))) <= e %figure out how to write not less than or equal to
    Value = (r(2,2));

else
    mid = (a + b) / 2;
    Value = (adapTrap26811194(f,a,mid,e/2) + adapTrap26811194(f,mid,b,e/2));
end


end

    

