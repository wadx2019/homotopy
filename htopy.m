function dHds = htopy(r, xi, a, s, x_lambda)
    persistent prev
    if isempty(prev)
        prev = zeros(size(x_lambda, 1),1);
        prev(end, 1) = 1;
    end
    x = x_lambda(end-1,:);
    lambda = x_lambda(end,:);
    dim = size(x, 2);
    dHdx = (1-lambda) * ones(dim, dim);
    for i=1:dim
        unit = zeros(dim);
        unit(i) = 1;
        dHdx(:, i) = dHdx(:,i) + lambda * (r(x+unit*xi) - r(x-unit*xi)) / (2*xi);
    end
    dHdlambda = r(x)' - (x-a)';
    dHdx_lambda = [dHdx dHdlambda];
    [Q, Rw, P] = qr(dHdx_lambda);
    R = Rw(:, 1:end-1);
    w = Rw(:, end);
    v = P*[pinv(R)*w; -1];
    dHds = v/norm(v);
    sgn = sign(dHds'*prev);
    dHds = sgn * dHds;
    prev = dHds;
end
