data = load("../HMP_Dataset/Climb_stairs/Accelerometer-2011-03-24-10-24-39-climb_stairs-f1.txt");

%% Data loaded and now we define a function for conversion and apply it to
% the data 
x = data(:,1);
y = data(:,2);
z = data(:,3);

plot_data(x,y,z,'Before conversion');

x = convert(data(:,1));
y = convert(data(:,2));
z = convert(data(:,3));

plot_data(x,y,z,'After conversion');

%%

figure
%% Next is to set up the sampling
% need a cosine signal cos(2*pi*f*t) 
t = linspace(-0.5,0.5,length(x));
c = (@(f,t) cos(2*pi*f*t));

% from the MANUAL.txt file included in the data. 
Fs = 32;


t_span = length(x)*(1/Fs)

freq = [5 30 60 80];
periods = freq.^(-1);

n_s = floor(t_span./periods);

for i = 1:length(freq)
    t_s = 0:t_span/n_s(i):(t_span - 1);
    plot(0:t_span/Fs:t_span,cos(0:t_span/Fs:t_span));
    hold on;
    stem(t_s, cos(t_s));
    hold off;
    pause(.01)
    
end


% this plot shows the cos using the first 100 frequencies. uncomment code
% below to see the plot
%figure(Visible="on",Name='custom cos')
% for i = 1:1e2
%     plot(t,c(i,t));
%     plot_title = sprintf('freq = %.2f',i);
%     title(plot_title)
%     pause(.1)
% end
%%
figure()
for i = [30]
    samples = find(c(i,linspace(0,length(x)*(1/32),length(x))) >= .98);
    vec = zeros(length(x),1);
    vec(samples) = 1;
    plot(1:length(vec),vec.*x,'*')
    hold on 
    plot(1:length(x),x)
    plot(1:length(x),c(i,linspace(-.5,.5,length(x))))
    hold off
    plot_title = sprintf('sampling freq = %.2f',i);
    title(plot_title)
    ylim([-15 15])
    pause(.2)
end
%%
% according to the Readme in the repo, there is a defined max and min
% From the file:
% Acceleration data recorded in the dataset are coded according to the
% following mapping:
% [0; +63] = [-1.5g; +1.5g] 
% the following function achieves this using the specified expression:
function a = convert(data)
g = 9.8; % as in m/s^2
a = -1.5*g + 3*g*(data/63);
end 

% creates a plot with subregions for each of the three values of interest
% also includes a name for the figure to tell what set is plotted
function plot_data(x,y,z,name)
figure(Visible="on",Name=name)
subplot(3,1,1)
plot(1:length(x),x)
title 'X-axis measurements'
xlabel 'number of samples'
ylabel 'accel-x'
grid on
subplot(3,1,2)
plot(1:length(y),y)
title 'Y-axis measurements'
xlabel 'number of samples'
ylabel 'accel-y'
grid on
subplot(3,1,3)
plot(1:length(z),z)
title 'Z-axis measurements'
xlabel 'number of samples'
ylabel 'accel-z'
grid on

end