


x = data(:,1);
y = data(:,2);
z = data(:,3);
figure
for i = 1:1:230
    diff3_x = [diffeq3(x,1),x];
    plot(diff3_x)
    ylim([min(min(diff3_x(:,1)),min(diff3_x(:,2))) ...
        max(max(diff3_x(:,1)),max(diff3_x(:,2))) ]*1.2)
    title('original signal with diff eq function 3')
    grid on
    hold on
    diff3_x = [diffeq3(x,i),x];
    plot(diff3_x(:,1),'-k')
    legend("y(n)","x(n)","y_{shifted}")
    hold off
    pause(.05)
end

x = converted_data(:,1);
y = converted_data(:,2);
z = converted_data(:,3);

figure
for i = 1:1:230
    diff3_x = [diffeq3(x,1),x];
    plot(diff3_x)
    ylim([min(min(diff3_x(:,1)),min(diff3_x(:,2))) ...
        max(max(diff3_x(:,1)),max(diff3_x(:,2))) ]*1.2)
    title('converted signal with diff eq function 3')
    grid on
    hold on
    diff3_x = [diffeq3(x,i),x];
    plot(diff3_x(:,1),'-k')
    legend("y(n)","x(n)","y_{shifted}")
    hold off
    pause(.05)
end
