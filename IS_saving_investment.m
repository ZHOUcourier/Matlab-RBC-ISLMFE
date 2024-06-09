% Parameters for IS curve
Y = linspace(0, 1000, 100);  % Income from 0 to 1000
r_eq1 = 0.05;  % First equilibrium interest rate
r_eq2 = 0.025;  % Second equilibrium interest rate
Y_eq1 = 500;  % First equilibrium income
Y_eq2 = 750;  % Second equilibrium income

% Saving and Investment
S = 0.0001 * Y;  % Saving function
I = 0.1 - 0.0001 * Y;  % Investment function
S_shifted = S - 0.05;  % Shifted Saving function

% Plot IS curve, Saving, and Investment
figure;

% Subplot 1: Saving and Investment
subplot(1, 2, 1);
hold on;
plot(Y, S, 'r', 'LineWidth', 2);  % Saving curve
plot(Y, I, 'g', 'LineWidth', 2);  % Investment curve
plot(Y, S_shifted, 'r--', 'LineWidth', 2);  % Shifted Saving curve
plot([Y_eq1, Y_eq1], [0, r_eq1], 'k--', 'LineWidth', 1);  % First equilibrium line
plot([0, Y_eq1], [r_eq1, r_eq1], 'k--', 'LineWidth', 1);  % First equilibrium line
plot([Y_eq2, Y_eq2], [0, r_eq2], 'k--', 'LineWidth', 1);  % Second equilibrium line
plot([0, Y_eq2], [r_eq2, r_eq2], 'k--', 'LineWidth', 1);  % Second equilibrium line
xlabel('Income (Y)');
ylabel('Interest Rate (r)');
title('Goods Market: Saving, Investment');
legend('Saving', 'Investment', 'Shifted Saving', 'Equilibrium 1', 'Equilibrium 2', 'Location', 'Best');
ylim([0, 0.1]);
grid on;
hold off;

% Subplot 2: IS curve
subplot(1, 2, 2);
hold on;
IS = 0.1 - 0.0001 * Y;  % IS curve
plot(Y, IS, 'b', 'LineWidth', 2);  % IS curve
plot([Y_eq1, Y_eq1], [0, r_eq1], 'k--', 'LineWidth', 1);  % First equilibrium line
plot([0, Y_eq1], [r_eq1, r_eq1], 'k--', 'LineWidth', 1);  % First equilibrium line
plot([Y_eq2, Y_eq2], [0, r_eq2], 'k--', 'LineWidth', 1);  % Second equilibrium line
plot([0, Y_eq2], [r_eq2, r_eq2], 'k--', 'LineWidth', 1);  % Second equilibrium line
xlabel('Income (Y)');
ylabel('Interest Rate (r)');
title('IS Curve');
ylim([0, 0.1]);
grid on;
hold off;
