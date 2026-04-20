%% Parameters
par = [0.2, 0.5, 0.5, 6776, 0, 0, 19287];   % [alpha, p, gamma, AS0, AI0, AR0, AO0]
H = [337 311 323 329 287 313 411 443 584 785 802 982 1240 1722 2196 2925 3975 4871 5409 5873];
theta = [0.0004260515, 0.0004468345, 0.0004676175, 0.0004884005, 0.0005091835, ...
         0.0005299665, 0.0005507495, 0.0005715325, 0.0005923155, 0.0006130985, ...
         0.0006338815, 0.0006546645, 0.0006754475, 0.0006962305, 0.0007170135, ...
         0.0007377965, 0.0007585795, 0.0007793625, 0.0008001455, 0.0008209285];
time = length(H);

p_perturb = 0.1;
sol_o = nurse_model(par, H, theta, time);
%t = time + 1;

figure; 
hold on;

% Plot the standard colors using shortcuts
plot(0:time, sol_o(1,:), 'b', 'LineWidth', 1.5);
plot(0:time, sol_o(2,:), 'r', 'LineWidth', 1.5);
plot(0:time, sol_o(3,:), 'g', 'LineWidth', 1.5);
plot(0:time, sol_o(4,:), 'k', 'LineWidth', 1.5);


% Add labels and legend
xlabel('Time'); 
ylabel('Population');
legend('AS','AI','AR','AO','backfill', 'redeploy');
title('Nurse Model Base Case');
grid on;

hold off;

%% Sensitivity analysis
% sensitivity index for alpha
sol_minus = nurse_model([par(1)*(1-p_perturb), par(2), par(3), par(4), par(5), par(6), par(7)], H, theta, time);
sol_plus  = nurse_model([par(1)*(1+p_perturb), par(2), par(3), par(4), par(5), par(6), par(7)], H, theta, time);
g_alpha_AS = zeros(1, time);
g_alpha_AI = zeros(1, time);
g_alpha_AR = zeros(1, time);
g_alpha_AO = zeros(1, time);

for t=1:time
g_alpha_AS(t) = ((sol_plus(1,t) - sol_minus(1,t)) / (2 * par(1) * p_perturb)) * ((par(1) / sol_o(1,t)));
g_alpha_AI(t) = ((sol_plus(2,t) - sol_minus(2,t)) / (2 * par(1) * p_perturb)) * ((par(1) / sol_o(2,t)));
g_alpha_AR(t) = ((sol_plus(3,t) - sol_minus(3,t)) / (2 * par(1) * p_perturb)) * ((par(1) / sol_o(3,t)));
g_alpha_AO(t) = ((sol_plus(4,t) - sol_minus(4,t)) / (2 * par(1) * p_perturb)) * ((par(1) / sol_o(4,t)));
end

%%
% sensitivity index for p
sol_minus = nurse_model([par(1), par(2)*(1-p_perturb), par(3), par(4), par(5), par(6), par(7)], H, theta, time);
sol_plus  = nurse_model([par(1), par(2)*(1+p_perturb), par(3), par(4), par(5), par(6), par(7)], H, theta, time);

g_p_AS = zeros(1, time);
g_p_AI = zeros(1, time);
g_p_AR = zeros(1, time);
g_p_AO = zeros(1, time);

for t=1:time
g_p_AS(t) = ((sol_plus(1,t) - sol_minus(1,t)) / (2 * par(2) * p_perturb)) * ((par(2) / sol_o(1,t)));
g_p_AI(t) = ((sol_plus(2,t) - sol_minus(2,t)) / (2 * par(2) * p_perturb)) * ((par(2) / sol_o(2,t)));
g_p_AR(t) = ((sol_plus(3,t) - sol_minus(3,t)) / (2 * par(2) * p_perturb)) * ((par(2) / sol_o(3,t)));
g_p_AO(t) = ((sol_plus(4,t) - sol_minus(4,t)) / (2 * par(2) * p_perturb)) * ((par(2) / sol_o(4,t)));
end

%% plot alpha for every compartment
hold on
plot(1:time, g_alpha_AS, 'b','LineWidth', 1.5);
plot(1:time, g_alpha_AI, 'r','LineWidth', 1.5);
plot(1:time, g_alpha_AR, 'g','LineWidth', 1.5);
plot(1:time, g_alpha_AO, 'k','LineWidth', 1.5);
yline(0,'r--')
legend('Susceptible', 'Infectious','Recovery','Other Unit', 'Insensitive','Location', 'best')
xlim([1 20])
xlabel('Time Step'); 
ylabel('Sensititivy Index');
title('Sensitivity of Nurse-to-Patient Ratio');
hold off
%% plot p for every compartment
hold on
plot(1:time, g_p_AS, 'b','LineWidth', 1.5);
plot(1:time, g_p_AI, 'r','LineWidth', 1.5);
plot(1:time, g_p_AR, 'g','LineWidth', 1.5);
plot(1:time, g_p_AO, 'k','LineWidth', 1.5);
yline(0,'r--')
legend('Susceptible', 'Infectious','Recovery','Other Unit', 'Insensitive','Location', 'best')
xlim([1 20])
xlabel('Time Step'); 
ylabel('Sensititivy Index');
title('Sensitivity of Redeployment Rate');
hold off

%% Bar plots
g_AS = [g_alpha_AS(end), g_p_AS(end)];
g_AI = [g_alpha_AI(end), g_p_AI(end)];
g_AR = [g_alpha_AR(end), g_p_AR(end)];
g_AO = [g_alpha_AO(end), g_p_AO(end)];

X = categorical({'Nurse-to-patient','Redeployment'});
X = reordercats(X, {'Nurse-to-patient','Redeployment'});

figure;

% AS
subplot(2,2,1);
bar(X, g_AS, 'b');
ylabel('Sensitivity Index');
xlabel('Parameters');
title('Susceptible');
ylim([-0.2 0.2]);

% AI
subplot(2,2,2);
bar(X, g_AI, 'r');
ylabel('Sensitivity Index');
xlabel('Parameters');
title('Infectious');
ylim([-0.2 0.2]);

% AR
subplot(2,2,3);
bar(X, g_AR, 'g');
ylabel('Sensitivity Index');
xlabel('Parameters');
title('Recovered');
ylim([-0.2 0.2]);

% AO
subplot(2,2,4);
bar(X, g_AO, 'k');
ylabel('Sensitivity Index');
xlabel('Parameters');
title('Other Unit');
ylim([-0.2 0.2]);

savefig('sensitivity_analysis_40.fig');
