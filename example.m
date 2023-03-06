clear all;
x0 = -2;
init_lambda = 0;
r=@(x)x.^2-1;

syms x 
solve(init_lambda*r(x)+(1-init_lambda)*(x+2)==0)

odefun=htopyodefun(r, 1e-12, x0);
option=odeset('Events', @htopyEvent, 'RelTol',1e-8);
[t, x, tt, xt, event]=ode45(odefun,[0 10], [x0 init_lambda],option)
solution = xt(1:end-1)
error = r(solution)
plot(x(:,2), x(:,1))
xlim([0 1])