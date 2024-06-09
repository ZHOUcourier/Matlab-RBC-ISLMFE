% Parameters
C0 = 100;   % Autonomous consumption
c = 0.8;    % Marginal propensity to consume
I0 = 150;   % Autonomous investment
b = 50;     % Investment sensitivity to interest rate
G = 200;    % Government spending
T = 50;     % Taxes
r = linspace(0, 0.2, 100);  % Interest rate from 0 to 20%

% Calculate Y for each r
Y = (C0 + I0 + G - c*T - b*r) / (1 - c);

% Plot IS curve
figure;
plot(Y, r, 'b', 'LineWidth', 2);
xlabel('Output (Y)');
ylabel('Interest Rate (r)');
title('IS Curve');
grid on;
