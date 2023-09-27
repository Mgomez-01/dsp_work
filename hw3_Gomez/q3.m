a = 0.6;
n = 0:999;
x_n = a .^ n;

minimum = -2;
maximum = 2;
step_size = .01;
n_step = (maximum - minimum)/step_size + 1;
f = linspace(minimum,maximum,(n_step));
[x,y] = meshgrid(f,f);
z = x + 1i*y;
X = arrayfun(@(zval) sum(x_n .* (zval .^ -n)), z);
X(isnan(X(:))) = Inf;


% Plot the magnitude of the Z-Transform
zvals = linspace(-2, 2, n_step);
imagesc(zvals, zvals, abs(X));
axis xy; axis square; grid on;
title('|X(z)|, Z-transform evaluation');
colormap('gray');
colorbar;
caxis([-20 20]);

% Hold the current plot
hold on;

leg = {'ROC boundary','Unit Circle'}
% Plot the ROC boundary at |z| = a
theta = linspace(0, 2*pi, 360);
x_roc = a * cos(theta);
y_roc = a * sin(theta);
plot(x_roc, y_roc, 'b--', 'LineWidth', 1.5);

% Plot the unit circle |z| = 1
x_unit = cos(theta);
y_unit = sin(theta);
plot(x_unit, y_unit, 'g', 'LineWidth', 1.5);
legend(leg)
% Release the hold
hold off;
