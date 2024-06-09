% Parameters for labor market
N = linspace(0, 1, 100);  % Labor from 0 to 1
w_eq = 0.5;  % Equilibrium real wage
N_eq = 0.5;  % Equilibrium labor

ND = w_eq - 0.5 * (N - N_eq);  % Labor demand curve
NS = w_eq + 0.5 * (N - N_eq);  % Labor supply curve

% Plot ND, NS, and FE curve
figure;

% Subplot 1: ND and NS
subplot(1, 2, 1);
hold on;
plot(N, ND, 'b', 'LineWidth', 2);  % ND curve
plot(N, NS, 'r', 'LineWidth', 2);  % NS curve
plot([N_eq, N_eq], [0, w_eq], 'k--', 'LineWidth', 1);  % Equilibrium line
plot([0, N_eq], [w_eq, w_eq], 'k--', 'LineWidth', 1);  % Equilibrium line
xlabel('Labor (N)');
ylabel('Real Wage (w)');
title('Labor Market: N^D, N^S');
legend('N^D', 'N^S', 'Equilibrium', 'Location', 'Best');
grid on;
hold off;

% Subplot 2: FE curve
subplot(1, 2, 2);
hold on;
plot([N_eq, N_eq], [0, 1], 'g', 'LineWidth', 2);  % FE curve
xlabel('Labor (N)');
ylabel('Real Wage (w)');
title('Full Employment (FE)');
ylim([0, 1]);
grid on;
hold off;
