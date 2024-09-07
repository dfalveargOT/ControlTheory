%%%%% Single-ball system constant velocity control

clear all
close all

%% system parameters
x0 = [0;0;0;0];

%% simulation
T = 5;
tspan = [0 T];
[t,x_sol] = ode45(@(t,x) single_ball_constant_velocity(t,x), tspan, x0);

%% plot solution
p_x_1 = x_sol(:,1);
v_x_1 = x_sol(:,2);
p_x_2 = x_sol(:,3);
v_x_2 = x_sol(:,4);

figure
hold on

plot(t, ones(size(t,1)), 'r--')
plot(t, v_x_1)
xlabel('t')
ylabel('v_x_1')

figure
hold on

plot(t, ones(size(t,1)), 'r--')
plot(t, v_x_2)
xlabel('t')
ylabel('v_x_2')

% %% Animated Plot
% N_data = size(p_x_1,1)
% N_tail = 1000
% 
% for i=1:N_data
%     
%     figure(1)
%     clf
%     hold on
%     
%     %% Plot circle with radius 2
%     plot(2*cos([0:.1:2*pi]), 2*sin([0:.1:2*pi]), 'r--')
%     
%     if (i > N_tail)
%         plot(x_1(i-N_tail:i), x_2(i-N_tail:i), 'LineWidth', 2, 'Color', 'Blue')
%         plot(x_1(i), x_2(i), 'r.', 'MarkerSize', 40)
%     else
%         plot(x_1(1:i), x_2(1:i), 'LineWidth', 2, 'Color', 'Blue')
%         plot(x_1(i), x_2(i), 'r.', 'MarkerSize', 40)
%     end
%     
%     xlabel('x_1')
%     ylabel('x_2')
%     xlim([-2.5 2.5])
%     ylim([-2.5 2.5])
%     
%     pause(.05)
%     drawnow
% end

function dx = single_ball_constant_velocity(t, x)
    A = [0 1 0 0;
         0 0 0 0;
         0 0 0 1;
         0 0 0 0];
    B = [0 0; 
         1 0;
         0 0;
         0 1];
    K = -[10.0000   10.9545    0.0000    0.0000;
         -0.0000   -0.0000   10.0000   10.9545];
    
    dx = A*x + B*K*(x - [t;1;t;1]) ;
    
end