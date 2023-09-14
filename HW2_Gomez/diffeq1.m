% difference eqs
function y = diffeq1(x,t)
    y = zeros(size(x));
    y(t) = 0;
    for n = (t+1):length(x)
        y(n) = .8*(y(n-1)) + x(n);
    end
end

