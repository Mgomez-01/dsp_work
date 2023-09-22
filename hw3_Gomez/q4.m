a = 0.6;
n = -999:-1;
x_n = -a .^ (-n);

[x, y] = meshgrid(linspace(-2, 2, 100), linspace(-2, 2, 100));
z = x + 1i * y;
% create function to hold the expression
X = arrayfun(@(zval) sum(x_n .* (zval .^ n)), z);
X(isnan(X(:))) = Inf;
zvals = linspace(-2, 2, 100);
imagesc(zvals, zvals, abs(X));
axis xy; axis square; grid on;
title('|X(z)|, Z-transform evaluation');
colormap('gray');
colorbar;
caxis([-20 20]);

hold on
leg = {'ROC boundary','Unit Circle'};
% Plot the ROC boundary at |z| = a
theta = linspace(0, 2*pi, 100);
x_roc = a * cos(theta);
y_roc = a * sin(theta);
plot(x_roc, y_roc, 'b--', 'LineWidth', 2);

% Plot the unit circle |z| = 1
x_unit = cos(theta);
y_unit = sin(theta);
plot(x_unit, y_unit, 'g', 'LineWidth', 2);
legend(leg)
hold off
