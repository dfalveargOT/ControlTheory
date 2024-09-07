%%%%% (1D) Single-ball system observer design

clear all
close all

%% system parameters
x0 = [-5;.1];
A = [0 1; 0 0];
C = [1 0];

%% compute the observer gain using pole placement
L = place(A',C',[-1, -5])';

%% simulation
xhat0 = [0;0];
T = 10;
tspan = [0 T];
[t,z_sol] = ode45(@(t,z) observer(t,z,A,C,L), tspan, [x0;xhat0]);

%% plot solution
p_sol = z_sol(:,1);
v_sol = z_sol(:,2);
phat_sol = z_sol(:,3);
vhat_sol = z_sol(:,4);

plot(t, p_sol)
hold on
plot(t, phat_sol)

legend('p','p_hat') 

function z_dot = observer(t,z,A,C,L)
    x = z(1:2)
    xhat = z(3:4)
    
    x_dot = A*x
    y = C*x
    
    xhat_dot = A*xhat + L*(y-C*xhat)
    
    z_dot = [x_dot;xhat_dot];
end
