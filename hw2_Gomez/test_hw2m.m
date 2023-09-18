%%HW 2 - Matlab Exercise 2
%Module 2 consists of 8 sections. loading data as we did before is where we begin
data = load('../HMP_Dataset/Climb_stairs/Accelerometer-2011-03-24-10-24-39-climb_stairs-f1.txt')
% loading in the data from the csv matrix
converted_data = convert(data);
x = converted_data(:,1);
y = converted_data(:,2);
z = converted_data(:,3);
%% Combining of signal
%can be done with an anon function
S = @(a, b, c) (sqrt(a.^2 + b.^2 + c.^2 ))
%with this we can convert the signal for computing the energy of it.
%We are in a discrete environment, so we need the following.
% matlabs sum function can do this across the vector and we can pass in the squared magnitude
%E = sum(mag_sigquared)
%% 2 combine and calculate energy
sig_S = S(x, y, z)';
mag_squared = abs(sig_S).^2 ;
energy_S = sum(mag_squared,"all","omitmissing","double");
%%3 Implementation of moving average
%showing the moving average working on the data below
avg_vec = [1 1 1];
conv_S = conv(x,avg_vec)./length(avg_vec);
plot(1:1:length(x),x,'b',1:1:length(conv_S),conv_S,'r')
title('combined signal and moving avg')
grid on
xlabel('samples n')
ylabel('value')
legend('original','avg')
%%Here is the convolved impulse across the signals
plot_avgs(x,'original_x')
plot_avgs(y,'original_y')
plot_avgs(z,'original_z')
%%
names = {"original_x","original_y","original_z"};
conv_names = {"converted_x","converted_y","converted_z"};
for i = 1:1:3
    plot_avgs(data(:,i),names{i})
    pause(.5)
    plot_avgs(converted_data(:,i),conv_names{i})
    pause(.5)
end

%% Section with difference equations and their plots. these are implemented as functions below.
% problem 4
diff1_x = [diffeq1(x),x];
figure
plot(diff1_x)

diff1_y = [diffeq1(y),y];
figure
plot(diff1_y)

diff1_z = [diffeq1(z),z];
figure
plot(diff1_z)

%% problem 5
diff2_x = [diffeq2(x),x];
figure
plot(diff2_x)

diff2_y = [diffeq2(y),y];
figure
plot(diff2_y)

diff2_z = [diffeq2(z),z];
figure
plot(diff2_z)

%% problem 6
diff3_x = [diffeq3(x,100),x];
figure
plot(diff3_x)
title('6 x')
diff3_y = [diffeq3(y,100),y];
figure
plot(diff3_y)
title('6 y')
diff3_z = [diffeq3(z,100),z];
figure
plot(diff3_z)
title('6 z')

%% Functions below
function a = convert(data)
g = 9.8; % as in m/s^2
a = -1.5*g + 3*g*(data/63);
end

function plot_avgs(x,name)
avg_vec = [1];
conv_sig = conv(x,avg_vec);
figure(visible='on')
plot(1:1:length(x),x,'b',2:1:(length(conv_sig)-1),conv_sig(2:end-1),'r');
title(sprintf('combined signal and moving avg for %s', name))
xlabel('samples n')
ylabel('value')
grid on
legend('original','avg')
end

function crossCorr(x)
avg_vec = [1 1 1]./3;
conv_sig = conv(x,avg_vec);
hx = filter(avg_vec,1,x);
convX = conv(hx,x);
reg_range = (1:1:length(hx))';
new_range = -floor(length(convX)/2):1:floor(length(convX)/2);
figure(visible='on')
plot(new_range,convX)
grid on
figure(visible='on')
plot(reg_range,hx,'k*',1:1:length(x),x,'b:',1:1:length(conv_sig),conv_sig,'r')
title('Original signal with average and filter function')
legend("h_x","x","My_{avg}")
grid on
end

% implements the first diff eq from homework set
function y = diffeq1(x)
    y = zeros(size(x));
    y(1) = 0;
    for n = 2:length(x)
        y(n) = .8*(y(n-1)) + x(n);
    end
end
% implements the second diff eq from homework set
function y = diffeq2(x)
    y = zeros(size(x));
    y(1) = 0;
    for n = 2:length(x)
        y(n) = (n/(n+1))*y(n-1) + (1/(n+1))*x(n);
    end
end
% implements the third diff eq from homework set
function y = diffeq3(x,t)
    y = zeros(size(x));
    y(1) = 0;
    y(2) = y(1) + x(2);
    for n = t:length(x)
        y(n) = y(n-1) - y(n-2) + x(n);
    end
end
