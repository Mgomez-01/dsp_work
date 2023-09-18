data = load('../HMP_Dataset/Climb_stairs/Accelerometer-2011-03-24-10-24-39-climb_stairs-f1.txt')
% loading in the data from the csv matrix
converted_data = convert(data);
x = converted_data(:,1);
y = converted_data(:,2);
z = converted_data(:,3);


%% problem 6
diff3_x = [diffeq3(x,1),x];
figure
plot(diff3_x)
title('6 x')
hold on

diff3_x = [diffeq3(x,100),x];
plot(diff3_x(:,1),'*-')
title('6 x starting n=100')
hold off


diff3_y = [diffeq3(y,100),y];
figure
plot(diff3_y)
title('6 y starting n=100')
hold on

diff3_y = [diffeq3(y,1),y];

plot(diff3_y(:,1),'*-')
title('6 y')
hold off

diff3_z = [diffeq3(z,1),z];
figure
plot(diff3_z)
title('6 z')
hold on
diff3_z = [diffeq3(z,100),z];

plot(diff3_z(:,1),'*-')
title('6 z starting n=100')
hold off


function a = convert(data)
g = 9.8; % as in m/s^2
a = -1.5*g + 3*g*(data/63);
end

