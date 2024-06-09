% Parameters for LM curve
M = 1000;   % Nominal money supply
P = 1;      % Price level
k = 0.5;    % Sensitivity of money demand to income
h = 2;      % Sensitivity of money demand to interest rate
Y = linspace(0, 1000, 100);  % Income from 0 to 1000
% r_eq = 0.04;  % Equilibrium interest rate
% Y_eq = 600;  % Equilibrium income
r_eq1 = 0.04;  % First equilibrium interest rate
r_eq2 = 0.02;  % Second equilibrium interest rate
Y_eq1 = 600;  % First equilibrium income
Y_eq2 = 800;  % Second equilibrium income

% Money demand and supply
MD = 0.1 - 0.0001 * Y;  % Money demand curve
MD_shifted = MD - 0.02;  % Shifted Saving function
MS = M / P * ones(size(Y));  % Money supply (vertical line at income = 600)

% Plot LM curve, Money demand, and Money supply
figure;

% Subplot 1: Money demand and supply
subplot(1, 2, 1);
hold on;
plot(Y, MD, 'r', 'LineWidth', 2);  % Money demand
plot(Y, MD_shifted, 'r--', 'LineWidth', 2);  % Shifted Money demand curve
plot([600, 600], [0, max(MD)], 'g', 'LineWidth', 2);  % Money supply (vertical)
% plot([Y_eq1, Y_eq1], [0, r_eq1], 'k--', 'LineWidth', 1);  % First equilibrium line
plot([0, Y_eq1], [r_eq1, r_eq1], 'k--', 'LineWidth', 1);  % First equilibrium line
% plot([Y_eq2, Y_eq2], [0, r_eq2], 'k--', 'LineWidth', 1);  % Second equilibrium line
plot([0, Y_eq2], [r_eq2, r_eq2], 'k--', 'LineWidth', 1);  % Second equilibrium line
xlabel('Income (Y)');
ylabel('Interest Rate (r)');
title('Money Market: M^D, M^S');
legend('M^D', 'Shifted M^D', 'M^S', 'Equilibrium 1', 'Equilibrium 2', 'Location', 'Best');
ylim([0, 0.1]);
grid on;
hold off;

% Subplot 2: LM curve
subplot(1, 2, 2);
hold on;
LM =  0.1 - 0.0001 * Y;  % LM curve (left bottom to right up)
plot(Y, LM, 'b', 'LineWidth', 2);  % LM curve
plot([Y_eq1, Y_eq1], [0, r_eq1], 'k--', 'LineWidth', 1);  % First equilibrium line
plot([0, Y_eq1], [r_eq1, r_eq1], 'k--', 'LineWidth', 1);  % First equilibrium line
plot([Y_eq2, Y_eq2], [0, r_eq2], 'k--', 'LineWidth', 1);  % Second equilibrium line
plot([0, Y_eq2], [r_eq2, r_eq2], 'k--', 'LineWidth', 1);  % Second equilibrium line
xlabel('Income (Y)');
ylabel('Interest Rate (r)');
title('LM Curve');
ylim([0, 0.1]);
grid on;
hold off;
