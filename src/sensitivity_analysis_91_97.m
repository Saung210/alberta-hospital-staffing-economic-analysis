%% Parameters
par = [0.2, 0.5, 0.5, 6776, 0, 0, 19287];   % [alpha, p, gamma, AS0, AI0, AR0, AO0]
H = [2234 2530 3823 6096 8373 10476];
theta = [0.01938822 0.01959590 0.01980338 0.02001006 0.02021674 0.02042342];
time = length(H);

p_perturb = 0.1;
sol_o = nurse_model(par, H, theta, time);
t = time + 1;

%% Sensitivity analysis

% sensitivity index for alpha
sol_minus = nurse_model([par(1)*(1-p_perturb), par(2), par(3), par(4), par(5), par(6), par(7)], H, theta, time);
sol_plus  = nurse_model([par(1)*(1+p_perturb), par(2), par(3), par(4), par(5), par(6), par(7)], H, theta, time);

g_alpha_AS = ((sol_plus(1,t) - sol_minus(1,t)) / (2 * par(1) * p_perturb)) * ((par(1) / sol_o(1,t)));
g_alpha_AI = ((sol_plus(2,t) - sol_minus(2,t)) / (2 * par(1) * p_perturb)) * ((par(1) / sol_o(2,t)));
g_alpha_AR = ((sol_plus(3,t) - sol_minus(3,t)) / (2 * par(1) * p_perturb)) * ((par(1) / sol_o(3,t)));
g_alpha_AO = ((sol_plus(4,t) - sol_minus(4,t)) / (2 * par(1) * p_perturb)) * ((par(1) / sol_o(4,t)));

% sensitivity index for p
sol_minus = nurse_model([par(1), par(2)*(1-p_perturb), par(3), par(4), par(5), par(6), par(7)], H, theta, time);
sol_plus  = nurse_model([par(1), par(2)*(1+p_perturb), par(3), par(4), par(5), par(6), par(7)], H, theta, time);

g_p_AS = ((sol_plus(1,t) - sol_minus(1,t)) / (2 * par(2) * p_perturb)) * ((par(2) / sol_o(1,t)));
g_p_AI = ((sol_plus(2,t) - sol_minus(2,t)) / (2 * par(2) * p_perturb)) * ((par(2) / sol_o(2,t)));
g_p_AR = ((sol_plus(3,t) - sol_minus(3,t)) / (2 * par(2) * p_perturb)) * ((par(2) / sol_o(3,t)));
g_p_AO = ((sol_plus(4,t) - sol_minus(4,t)) / (2 * par(2) * p_perturb)) * ((par(2) / sol_o(4,t)));

% sensitivity index for gamma
sol_minus = nurse_model([par(1), par(2), par(3)*(1-p_perturb), par(4), par(5), par(6), par(7)], H, theta, time);
sol_plus  = nurse_model([par(1), par(2), par(3)*(1+p_perturb), par(4), par(5), par(6), par(7)], H, theta, time);

g_gamma_AS = ((sol_plus(1,t) - sol_minus(1,t)) / (2 * par(3) * p_perturb)) * ((par(3) / sol_o(1,t)));
g_gamma_AI = ((sol_plus(2,t) - sol_minus(2,t)) / (2 * par(3) * p_perturb)) * ((par(3) / sol_o(2,t)));
g_gamma_AR = ((sol_plus(3,t) - sol_minus(3,t)) / (2 * par(3) * p_perturb)) * ((par(3) / sol_o(3,t)));
g_gamma_AO = ((sol_plus(4,t) - sol_minus(4,t)) / (2 * par(3) * p_perturb)) * ((par(3) / sol_o(4,t)));

%% Bar plots
g_AS = [g_alpha_AS, g_p_AS, g_gamma_AS];
g_AI = [g_alpha_AI, g_p_AI, g_gamma_AI];
g_AR = [g_alpha_AR, g_p_AR, g_gamma_AR];
g_AO = [g_alpha_AO, g_p_AO, g_gamma_AO];

X = categorical({'alpha','p','gamma'});
X = reordercats(X, {'alpha','p','gamma'});

figure;

% AS
subplot(2,2,1);
bar(X, g_AS, 'r');
ylabel('Sensitivity Index (AS)');
xlabel('Parameters');
title(['Sensitivity Index for AS']);
ylim([-0.25 0.25]);

% AI
subplot(2,2,2);
bar(X, g_AI, 'b');
ylabel('Sensitivity Index (AI)');
xlabel('Parameters');
title(['Sensitivity Index for AI']);
ylim([-0.75 0.75]);

% AR
subplot(2,2,3);
bar(X, g_AR, 'g');
ylabel('Sensitivity Index (AR)');
xlabel('Parameters');
title(['Sensitivity Index for AR']);
ylim([-0.5 0.5]);

% AO
subplot(2,2,4);
bar(X, g_AO, 'm');
ylabel('Sensitivity Index (AO)');
xlabel('Parameters');
title(['Sensitivity Index for AO']);
ylim([-0.25 0.25]);

savefig('sensitivity_analysis_91_97.fig');

%% Table
Parameter = {'alpha'; 'p'; 'gamma'};
SensitivityTable = table(Parameter, g_AS', g_AI', g_AR', g_AO', ...
    'VariableNames', {'Parameter','AS_SI','AI_SI','AR_SI','AO_SI'});

disp(SensitivityTable);
