%%%%% Circular motion LQR control design
A = [0 -1;
    1 0];
B = [0; 1];

lambda = 1;
Q = eye(2);
R = lambda*eye(1);
N = zeros(2,1);
[K,S,e] = lqr(A,B,Q,R,N)