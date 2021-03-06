function s = s_1(x,y)

c_11 = 11.8*(1-x).*y + 8.329*x.*y + 14.12*(1-x).*(1-y) + 10.22*x.*(1-y);
c_11 = 1e11 * c_11 * 1e-3/1e-2;

c_12 = 5.38*(1-x).*y + 4.526*x.*y + 6.253*(1-x).*(1-y) + 5.76*x.*(1-y);
c_12 = 1e11 * c_12 * 1e-3/1e-2;

dEgdp = 11.5*(1-x).*y + 10.0*x.*y + 11.0*(1-x).*(1-y) + 8.5*x.*(1-y);

dEgdp = 1e-6 * 1.6*1e-19 / 1e5 * dEgdp;

av = -1/3 * (   c_11  +  2*c_12  ) .* dEgdp;

s = -2*av.* (   1  -  c_12 ./ c_11  ) .*  strain(x,y);