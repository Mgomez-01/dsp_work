function y = diffeq2(x,t)
    y = zeros(size(x));
    y(t) = 0;
    for n = (t+1):length(x)
        y(n) = (n/(n+1))*y(n-1) + (1/(n+1))*x(n);
    end
end
