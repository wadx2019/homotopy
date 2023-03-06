function [value, isterminal, direction] = htopyEvent(t, y)
    value = y(end) - 1;
    isterminal = 1;
    direction = 0;
end