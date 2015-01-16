function [X, Y, Vx, Vy] = dessimateMotionField(X, Y, Vx, Vy, factor)

    s = min(size(Vx));
    
    inc = round(min(1/factor, s/4));
    
    window = getWindow(inc, 'gaussian');
    
    Vx = conv2(Vx, window, 'same');
    Vy = conv2(Vy, window, 'same');

    X = X(1:inc:end, 1:inc:end);
    Y = Y(1:inc:end, 1:inc:end);

    Vx = Vx(1:inc:end, 1:inc:end);
    Vy = Vy(1:inc:end, 1:inc:end);
    
end