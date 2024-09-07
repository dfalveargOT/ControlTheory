%%%%% Circular motion
clear all
close all

%% system parameters
x0 = [1;0];

%% simulation
T = 20;
tspan = [0 T];
[t,x_sol] = ode45(@(t,x) V_circular(t,x), tspan, x0);

%% plot solution
x_1 = x_sol(:,1);
x_2 = x_sol(:,2);

% figure
% plot(t, x_1)
% xlabel('t')
% ylabel('x_1')
% 
% figure
% plot(t, x_2)
% xlabel('t')
% ylabel('x_2')

%% Animated Plot
N_data = size(x_1,1)
N_tail = 1000

for i=1:N_data
    
    figure(1)
    clf
    hold on
    
    if (i > N_tail)
        plot(x_1(i-N_tail:i), x_2(i-N_tail:i), 'LineWidth', 2, 'Color', 'Blue')
        plot(x_1(i), x_2(i), 'r.', 'MarkerSize', 40)
    else
        plot(x_1(1:i), x_2(1:i), 'LineWidth', 2, 'Color', 'Blue')
        plot(x_1(i), x_2(i), 'r.', 'MarkerSize', 40)
    end
    
    xlabel('x_1')
    ylabel('x_2')
    xlim([-2.5 2.5])
    ylim([-2.5 2.5])
    
    pause(.05)
    drawnow
end

function dx = V_circular(t, x)
    A = [0 -1;
         1 0];
    dx = A*x ;
    
end