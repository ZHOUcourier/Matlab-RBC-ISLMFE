% % 清空环境
% clear;
% clc;
% 
% % 定义参数
% beta = 0.99;      % 折现因子
% alpha = 0.36;     % 资本在生产中的份额
% delta = 0.025;    % 资本折旧率
% rho = 0.95;       % 技术冲击的自回归系数
% sigma = 0.02;     % 技术冲击的标准差
% 
% % 初始值
% C = 1;            % 初始消费
% K = 1;            % 初始资本
% N = 0.3;          % 初始劳动
% A = 0;            % 初始技术水平
% 
% % 时间步长和总步数
% T = 100;          % 总步数
% 
% % 预分配数组存储结果
% C_series = zeros(T, 1);
% K_series = zeros(T, 1);
% N_series = zeros(T, 1);
% A_series = zeros(T, 1);
% epsilon_series = sigma * randn(T, 1); % 随机生成技术冲击
% 
% % 初始值
% C_series(1) = C;
% K_series(1) = K;
% N_series(1) = N;
% A_series(1) = A;
% 
% % 使用符号工具箱定义符号变量
% syms C_t K_t N_t A_t epsilon_t
% 
% % 定义模型方程
% C_tp1 = beta * (C_t * (1 + alpha * exp(A_t) * (K_t^(alpha-1)) * (N_t^(1-alpha)) - delta));
% K_tp1 = exp(A_t) * K_t^alpha * N_t^(1-alpha) + (1 - delta) * K_t - C_t;
% N_tp1 = (1 - alpha) * exp(A_t) * (K_t / N_t)^alpha;
% A_tp1 = rho * A_t + epsilon_t;
% 
% % 创建匿名函数以便求解数值
% C_func = matlabFunction(C_tp1, 'Vars', {C_t, K_t, N_t, A_t, epsilon_t});
% K_func = matlabFunction(K_tp1, 'Vars', {C_t, K_t, N_t, A_t, epsilon_t});
% N_func = matlabFunction(N_tp1, 'Vars', {C_t, K_t, N_t, A_t, epsilon_t});
% A_func = matlabFunction(A_tp1, 'Vars', {C_t, K_t, N_t, A_t, epsilon_t});
% 
% % 模拟过程
% for t = 1:T-1
%     C_series(t+1) = C_func(C_series(t), K_series(t), N_series(t), A_series(t), epsilon_series(t));
%     K_series(t+1) = K_func(C_series(t), K_series(t), N_series(t), A_series(t), epsilon_series(t));
%     N_series(t+1) = N_func(C_series(t), K_series(t), N_series(t), A_series(t), epsilon_series(t));
%     A_series(t+1) = A_func(C_series(t), K_series(t), N_series(t), A_series(t), epsilon_series(t));
% end
% 
% % 绘制消费、资本、劳动和技术水平的时间序列
% figure;
% subplot(2, 2, 1);
% plot(C_series);
% title('消费时间序列');
% xlabel('时间');
% ylabel('消费');
% 
% subplot(2, 2, 2);
% plot(K_series);
% title('资本时间序列');
% xlabel('时间');
% ylabel('资本');
% 
% subplot(2, 2, 3);
% plot(N_series);
% title('劳动时间序列');
% xlabel('时间');
% ylabel('劳动');
% 
% subplot(2, 2, 4);
% plot(A_series);
% title('技术水平时间序列');
% xlabel('时间');
% ylabel('技术水平');


% 清空环境
clear;
clc;

% 定义参数
beta = 0.99;      % 折现因子
alpha = 0.36;     % 资本在生产中的份额
delta = 0.025;    % 资本折旧率
rho = 0.95;       % 技术冲击的自回归系数
sigma = 0.02;     % 技术冲击的标准差

% 初始值
C = 1;            % 初始消费
K = 1;            % 初始资本
N = 0.3;          % 初始劳动
A = 0;            % 初始技术水平

% 时间步长和总步数
T = 100;          % 总步数

% 预分配数组存储结果
C_series = zeros(T, 1);
K_series = zeros(T, 1);
N_series = zeros(T, 1);
A_series = zeros(T, 1);
Y_series = zeros(T, 1); % 产出
I_series = zeros(T, 1); % 投资
w_series = zeros(T, 1); % 工资率
r_series = zeros(T, 1); % 资本回报率
epsilon_series = sigma * randn(T, 1); % 随机生成技术冲击

% 初始值
C_series(1) = C;
K_series(1) = K;
N_series(1) = N;
A_series(1) = A;
Y_series(1) = exp(A) * K^alpha * N^(1 - alpha); % 初始产出
I_series(1) = K - (1 - delta) * K; % 初始投资
w_series(1) = (1 - alpha) * exp(A) * (K / N)^alpha; % 初始工资率
r_series(1) = alpha * exp(A) * (N / K)^(1 - alpha); % 初始资本回报率

% 使用符号工具箱定义符号变量
syms C_t K_t N_t A_t epsilon_t

% 定义模型方程
C_tp1 = beta * (C_t * (1 + alpha * exp(A_t) * (K_t^(alpha-1)) * (N_t^(1-alpha)) - delta));
K_tp1 = exp(A_t) * K_t^alpha * N_t^(1-alpha) + (1 - delta) * K_t - C_t;
N_tp1 = (1 - alpha) * exp(A_t) * (K_t / N_t)^alpha;
A_tp1 = rho * A_t + epsilon_t;

% 创建匿名函数以便求解数值
C_func = matlabFunction(C_tp1, 'Vars', {C_t, K_t, N_t, A_t, epsilon_t});
K_func = matlabFunction(K_tp1, 'Vars', {C_t, K_t, N_t, A_t, epsilon_t});
N_func = matlabFunction(N_tp1, 'Vars', {C_t, K_t, N_t, A_t, epsilon_t});
A_func = matlabFunction(A_tp1, 'Vars', {C_t, K_t, N_t, A_t, epsilon_t});

% 模拟过程
for t = 1:T-1
    C_series(t+1) = C_func(C_series(t), K_series(t), N_series(t), A_series(t), epsilon_series(t));
    K_series(t+1) = K_func(C_series(t), K_series(t), N_series(t), A_series(t), epsilon_series(t));
    N_series(t+1) = N_func(C_series(t), K_series(t), N_series(t), A_series(t), epsilon_series(t));
    A_series(t+1) = A_func(C_series(t), K_series(t), N_series(t), A_series(t), epsilon_series(t));
    Y_series(t+1) = exp(A_series(t+1)) * K_series(t+1)^alpha * N_series(t+1)^(1-alpha);
    w_series(t+1) = (1 - alpha) * exp(A_series(t+1)) * (K_series(t+1) / N_series(t+1))^alpha;
    r_series(t+1) = alpha * exp(A_series(t+1)) * (N_series(t+1) / K_series(t+1))^(1 - alpha);
end

% 处理投资的计算
for t = 1:T-1
    I_series(t+1) = K_series(t+1) - (1 - delta) * K_series(t);
end

% 绘制时间序列图
figure;
subplot(3, 3, 1);
plot(C_series);
title('消费时间序列');
xlabel('时间');
ylabel('消费');

subplot(3, 3, 2);
plot(K_series);
title('资本时间序列');
xlabel('时间');
ylabel('资本');

subplot(3, 3, 3);
plot(N_series);
title('劳动时间序列');
xlabel('时间');
ylabel('劳动');

subplot(3, 3, 4);
plot(A_series);
title('技术水平时间序列');
xlabel('时间');
ylabel('技术水平');

subplot(3, 3, 5);
plot(Y_series);
title('产出时间序列');
xlabel('时间');
ylabel('产出');

subplot(3, 3, 6);
plot(I_series);
title('投资时间序列');
xlabel('时间');
ylabel('投资');

subplot(3, 3, 7);
plot(w_series);
title('工资率时间序列');
xlabel('时间');
ylabel('工资率');

subplot(3, 3, 8);
plot(r_series);
title('资本回报率时间序列');
xlabel('时间');
ylabel('资本回报率');
