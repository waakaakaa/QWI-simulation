function str = strain(x,y)

a = 5.6533*(1-x).*y + 6.0584*x.*y + 5.4512*(1-x).*(1-y) + 5.8688*x.*(1-y);
a1 = a * 1e-10;

x = 1;
y = 0;
a = 5.6533*(1-x).*y + 6.0584*x.*y + 5.4512*(1-x).*(1-y) + 5.8688*x.*(1-y);
a = a * 1e-10;

str = (a-a1)./a1;