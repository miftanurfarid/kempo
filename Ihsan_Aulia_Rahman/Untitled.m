mc = 9.173;
mcw = 15.151;
mmax = 11.941;
jd = 0.001435;
jo1 = 0.000133;
jo2 = 0.000133;
rd = 0.0455;
ro1 = 0.052;
ro2 = 0.052;
kc = 97357;
kcw = 950590;
ko1 = 72261;
ko2 = 72261;
bc = 21.4;
bcw = 21.3;
bo1 = 29.7;
bo2 = 29.7;
bcl = 8.3;
bcwl = 8.3;
m = 1000;
A = -kc/(m+mc);
B = kc*ro1/(m+mc);
C = bc*ro1/(m+mc);
D = -(bc+bcl)/(m+mc);

Am = [0 1 0 0 0 0 0 0 0 0 
      A D 0 0 0 0 B C 0 0
      0 0 0 1 0 0 0 0 0 0
      0 0 -kcw/mcw -(bcw+bcwl)/mcw 0 0 0 0 kcw*ro2/mcw bcw*ro2/mcw
      0 0 0 0 0 1 0 0 0 0
      0 0 0 0 -(rd)^2*(ko1+ko2)/jd -(rd)^2*(bo1+bo2)/jd ko1*rd*ro1/jd bo1*rd*ro1/jd ko2*rd*ro2/jd bo2*rd*ro2/jd
      0 0 0 0 0 0 0 1 0 0
      kc*ro1/jo1 bc*ro1/jo1 0 0 ko1*rd*ro1/jo1 bo1*rd*ro1/jo1 -(ro1)^2*(kc+ko1)/jd -(ro1)^2*(bc+bo1)/jo1 0 0
      0 0 0 0 0 0 0 0 0 1
      0 0 kcw*ro2/jo2 bcw*ro2/jo2 ko2*rd*ro2/jo2 bo2*rd*ro2/jo2 0 0 -(ro2)^2*(kcw+ko2)/jo2 -(ro2)^2*(bcw+bo2)/jo2];
Bm = [0
      0
      0
      0
      0
      1/jd
      0
      0
      0
      0];
  Cm = [0 0 0 0 0 1 0 0 0 0];
  Dm = 0;
  G = ss(A,B,C,D);
  step(G);
  [u,t] = gensig('sin',1,100,5);
  plot(t,u); 