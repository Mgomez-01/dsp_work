%% HW3 q1 signal x[n] = \alpha{n}
n = 0:1:999;
a = 0.6;
x1 = a.^n;
% calculating the sum in the space of 0-999 can be done with the sum function
res = sum(x1)
disp(sprintf('The z-transform comes out to %2.2f.',res))
