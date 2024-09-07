%%%%% Single-ball system rotational motion

clear all
close all

%% system parameters
x0 = [0;0;0;0];

%% simulation
T = 20;
tspan = [0 T];
[t,x_sol] = ode45(@(t,x) single_ball_constant_velocity(t,x), tspan, x0);

%% plot solution
p_x_1 = x_sol(:,1);
v_x_1 = x_sol(:,2);
p_x_2 = x_sol(:,3);
v_x_2 = x_sol(:,4);

% figure
% hold on
% 
% plot(t, ones(size(t,1)), 'r--')
% plot(t, v_x_1)
% xlabel('t')
% ylabel('v_x_1')
% 
% figure
% hold on
% 
% plot(t, ones(size(t,1)), 'r--')
% plot(t, v_x_2)
% xlabel('t')
% ylabel('v_x_2')

%% Animated Plot
N_data = size(p_x_1,1)
N_tail = 1000

for i=1:N_data
    
    figure(1)
    clf
    hold on
    
    %% Plot circle with radius 1
    plot(1*cos([0:.1:2*pi]), 1*sin([0:.1:2*pi]), 'r--')
    
    if (i > N_tail)
        plot(p_x_1(i-N_tail:i), p_x_2(i-N_tail:i), 'LineWidth', 2, 'Color', 'Blue')
        plot(p_x_1(i), p_x_2(i), 'r.', 'MarkerSize', 40)
    else
        plot(p_x_1(1:i), p_x_2(1:i), 'LineWidth', 2, 'Color', 'Blue')
        plot(p_x_1(i), p_x_2(i), 'r.', 'MarkerSize', 40)
    end
    
    xlabel('p_x_1')
    ylabel('p_x_2')
    xlim([-1.5 1.5])
    ylim([-1.5 1.5])
    
    pause(.01)
    drawnow
end

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
    
    dx = A*x + B*(K*(x - [cos(t);-sin(t);sin(t);cos(t)]) + [-cos(t); -sin(t)]);
    
end