K = 2;
T = 3;
A = [0 0 0 0 0;
     0 0 0 0 0;
     0 0 0 1 0;
     0 0 0 -1/T -K/T;
     0 0 0 0 0];
B = [0 0 0 K/T 0]';

C = [0 0 1 0 0];

D = 0;

[num, den] = ss2tf(A, B, C, D)