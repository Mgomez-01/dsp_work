filename = '../HMP_Dataset/Climb_stairs/Accelerometer-2011-03-24-10-24-39-climb_stairs-f1.txt'
data = load(filename);
  %%
  % loading in the data from the csv matrix
x = data(:,1);
y = data(:,2);
z = data(:,3);
%% Combining of signal
S = @(a, b, c) (sqrt(a.^2 + b.^2 + c.^2 ));

%% 2 combine and calculate energy
sig_S = S(x, y, z)';
mag_squared = abs(sig_S).^2 ;
energy_S = sum(mag_squared,"all","omitmissing","double");

%% 3 Implementation of moving average
avg_vec = [1 1 1];
conv_S = conv(x,avg_vec)./length(avg_vec);
plot(1:1:length(x),x,'b',1:1:length(conv_S),conv_S,'r')
title('combined signal and moving avg')
xlabel('samples n')
ylabel('value')
legend('original','avg')
%%
function a = convert(data)
g = 9.8; % as in m/s^2
a = -1.5*g + 3*g*(data/63);
end
