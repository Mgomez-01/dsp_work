% % implements the third diff eq from homework set
function y = diffeq3(x,t)
    y = zeros(size(x));
    y(t+0) = 0;
    y(t+1) = y(t) + x(t+1);
    for n = (t+2):length(x)
        y(n) = y(n-1) - y(n-2) + x(n);
    end
end

