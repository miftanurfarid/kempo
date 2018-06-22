k1 = 120;
k2 = 15;
c1 = 0.12;
c2 = 0.015;
m1 = 0.35; % kg
m2 = 0.05;
F =
x1 =
x2 =
x3 =
x4 =

Am = [0 1 0 0; (k1-k2)/m1 -(c1+c2)/m1 k2 c2/m1; 0 0 0 1; k2/m2 c2/m2 -k2/m2 -c2/m2]
Bm = [x1; x2; x3; x4];
Cm = [0 F/m1 0 0];
Dm = F;
G = ss(A,B,C,D);
  step(G);
  [u,t] = gensig('sin',1,100,5);
  plot(t,u); 