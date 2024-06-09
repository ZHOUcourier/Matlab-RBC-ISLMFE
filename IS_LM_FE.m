% Parameters for IS curve
Y_IS = linspace(0, 1000, 100);  % Income for IS curve
r_IS = 0.1 - 0.0001 * Y_IS;     % IS curve

% Parameters for LM curve
r_LM = 0.0001 * Y_IS;  % LM curve

% Full employment output
Y_FE = 500;  % Full employment output

% Plot IS, LM, and FE curves
figure;
hold on;
plot(Y_IS, r_IS, 'b', 'LineWidth', 2);  % IS curve
plot(Y_IS, r_LM, 'r', 'LineWidth', 2);  % LM curve
plot([Y_FE, Y_FE], [0, max(r_LM)], 'g', 'LineWidth', 2);  % FE curve
% plot([Y_FE, Y_FE], [0, max(r_LM)], 'k--', 'LineWidth', 1);  % Equilibrium line
% plot([0, Y_FE], [max(r_LM) * 0.5, max(r_LM) * 0.5], 'k--', 'LineWidth', 1);  % Equilibrium line
xlabel('Output (Y)');
ylabel('Interest Rate (r)');
title('IS-LM-FE Model');
legend('IS', 'LM', 'FE', 'Equilibrium', 'Location', 'Best');
ylim([0, 0.1]);
grid on;
hold off;
