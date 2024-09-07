%%%%% (1D) Single-ball system output feedback design

clear all
close all

%% system parameters
x0 = [-5;0];
A = [0 1; 0 0];
B = [0;1];
C = [1 0];

%% reference point
xbar = [1;0];

%% compute the observer gain using pole placement
L = place(A',C',[-1, -5])';

%% compute state feedback using pole placement
K = -place(A,B,[-1, -5]);
% A_BK = A+B*K;

%% simulation
xhat0 = [0;0];
T = 20;
tspan = [0 T];
[t,z_sol] = ode45(@(t,z) output_feedback_vf(t,z,A,B,C,L,K,xbar), tspan, [x0;xhat0]);

%% plot solution
p_sol = z_sol(:,1);
v_sol = z_sol(:,2);
phat_sol = z_sol(:,3);
vhat_sol = z_sol(:,4);

plot(t, p_sol)
hold on
plot(t, v_sol)

legend('p','v') 

function z_dot = output_feedback_vf(t,z,A,B,C,L,K,xbar)
    x = z(1:2)
    xhat = z(3:4);
    
    u = K*(xhat-xbar);
    x_dot = A*x + B*u;
    y = C*x;
    
    xhat_dot = A*xhat+B*u + L*(y-C*xhat);
    
    z_dot = [x_dot;xhat_dot];
end
