function [rts] = quartic26811194(a,b,c,d)
f=@(x) a*x^4 + b*x^3 + c*x^2 + d*x + 1;
i = 1;
err = 10^-5;
iter = 1000;
%tests:
% disp('a')
% disp(a)
% disp('b')
% disp(b)
% disp('c')
% disp(c)
% disp('d')
% disp(d)

x_min = -((1/ abs(a)) * max([abs(b), abs(c), abs(d), 1]) + 1);
x_large = ((1/ abs(a)) * max([abs(b), abs(c), abs(d), 1]) + 1);
x_bisec = (x_min + x_large) / 2;

while i <= iter
    if and(and(f(x_bisec) < 0, f(x_min) < 0),f(x_large) > 0)
        x_min = x_bisec;
    elseif and(and(f(x_bisec) < 0, f(x_large) < 0), f(x_min) > 0)
        x_large = x_bisec;
    elseif and(and(f(x_bisec) > 0, f(x_min) < 0),f(x_large) > 0)
        x_large = x_bisec;
    elseif and(and(f(x_bisec) > 0, f(x_large) < 0), f(x_min) > 0)
        x_min = x_bisec;
    elseif abs(f(x_bisec) - f(x_min)) < abs(f(x_bisec) - f(x_large))
        x_min = x_bisec;
    else
        x_large = x_bisec;
    end
    if (abs(x_large - x_min)/ abs(x_min)) <= err
        i = iter + 1;
    else
        x_bisec = (x_min + x_large) / 2;
        i = i + 1;
    end
end

root1 = x_bisec;
disp(root1);

% ~part 2~

b = b + a * (x_bisec);
c = c + b * (x_bisec);
d = d + c * (x_bisec);
f = @(x) a*x^3 + b*x^2 + c*x + d;

i = 1;
err = 10^-5;
iter = 1000;

x_min = -((1/ abs(a)) * max([abs(b), abs(c), abs(d)]) + 1);

x_large = ((1/ abs(a)) * max([abs(b), abs(c), abs(d)]) + 1);
x_bisec = (x_min + x_large) / 2;

while i <= iter
    if and(and(f(x_bisec) < 0, f(x_min) < 0),f(x_large) > 0)
        x_min = x_bisec;
    elseif and(and(f(x_bisec) < 0, f(x_large) < 0), f(x_min) > 0)
        x_large = x_bisec;
    elseif and(and(f(x_bisec) > 0, f(x_min) < 0),f(x_large) > 0)
        x_large = x_bisec;
    elseif and(and(f(x_bisec) > 0, f(x_large) < 0), f(x_min) > 0)
        x_min = x_bisec;
    elseif abs(f(x_bisec) - f(x_min)) < abs(f(x_bisec) - f(x_large))
        x_min = x_bisec;
    else
        x_large = x_bisec;
    end
    
    if (abs(x_large - x_min)/ abs(x_min)) <= err
        i = iter + 1;
    else
        x_bisec = (x_min + x_large) / 2;
        i = i + 1;
    end
end

root2 = x_bisec;
disp(root2);

% ~part 3~

b = b + a * (x_bisec);
c = c + b * (x_bisec);
root3 = (-b + sqrt(b^2 - 4 * a * c))/(2*a);
root4 = (-b - sqrt(b^2 - 4 * a * c))/(2*a);
rts = [root1 root2 root3 root4];