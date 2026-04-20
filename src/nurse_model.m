function [sol] = nurse_model(par, H, theta, time)

alpha = par(1);
p     = par(2);
gamma = par(3);

AS0 = par(4);
AI0 = par(5);
AR0 = par(6);
AO0 = par(7);

AS = zeros(1, time+1);
AI = zeros(1, time+1);
AR = zeros(1, time+1);
AO = zeros(1, time+1);

AS(1) = AS0;
AI(1) = AI0;
AR(1) = AR0;
AO(1) = AO0;


for t = 1:time
    Dt = AS0 + (alpha * H(t));
    AC = AS(t) + AR(t);

    backfill = max(0, Dt - AC);
    redeploy = min(AO(t), p * backfill);

    new_inf = min(theta(t) * AS(t), AS(t));
    ret = (1 - exp(-gamma)) * AI(t);

    AS(t+1) = AS(t) - new_inf + redeploy;
    AI(t+1) = AI(t) + new_inf - ret;
    AR(t+1) = AR(t) + ret;
    AO(t+1) = AO(t) - redeploy;
end

% Pack output  (each row one variable)
sol(1,:) = AS;
sol(2,:) = AI;
sol(3,:) = AR;
sol(4,:) = AO;

end
