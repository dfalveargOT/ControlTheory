%%%%% Single-ball system LQR control design

%% LQR
A = [0 1 0 0;
    0 0 0 0;
    0 0 0 1;
    0 0 0 0];
B = [0 0;
    1 0;
    0 0;
    0 1];
     
lambda = .01;
% lambda = .0001;
Q = eye(4);
R = lambda*eye(2);
N = zeros(4,2);
[K,S,e] = lqr(A,B,Q,R,N);
