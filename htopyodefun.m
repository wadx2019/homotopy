function odefun = htopyodefun(r, xi, a)
    odefun = @(t, y)htopy(r, xi, a, t, y);
end