
%% q2
% Define the signal h[n] = 1/n
h = @(n) 1 ./ n;

% Create a figure
figure;

% Initialize k
k_init = 4;

% Precompute Z-Transform values
omega_values = linspace(0, pi, 100);
z_values = arrayfun(@(omega) computeZTransformFunc(k_init, omega, h), omega_values);

% Plot the initial data
%plot3_handle = plot(omega_values, abs(z_values), 'LineWidth', 2);
plot3_handle = plot3(omega_values, real(z_values), imag(z_values), 'LineWidth', 2);
xlabel('ω');
ylabel('\itRe');
zlabel('\itIm');
title(sprintf('Interactive 3D Plot of Z-Transform at %d',k_init));
grid on;

% Create a slider for k with integer steps
% Create a slider for k with integer steps and custom position
slider_handle = uicontrol('Style', 'slider', 'Min', 1, 'Max', 8, 'Value', k_init, 'SliderStep', [1, 1], 'Units', 'normalized', 'Position', ...
                          [.94, .05, 0.05, 0.9], 'Callback', @(src, event) updatePlot(src, event, plot3_handle, omega_values, h));

% Update function
function updatePlot(src, ~, plot3_handle, omega_values, h)
    k = round(src.Value); % Round to the nearest integer
    src.Value = k; % Update the slider value to the rounded integer
    z_values = arrayfun(@(omega) computeZTransformFunc(k, omega, h), omega_values); % Recompute Z-Transform values
    set(plot3_handle, 'XData', omega_values, 'YData', real(z_values), 'ZData', imag(z_values)); % Update the plot
    title(sprintf('Interactive 3D Plot of Z-Transform at %d',k));
end

% Compute the Z-Transform (nested function)
function z_value = computeZTransformFunc(k, omega, h)
    h_values = arrayfun(h, 1:k); % h[n] = 1/n
    z_value = abs(sum(h_values .* exp(-1i * (1:k) * omega)));
end

