function [X, Y] = thresholdField(Vx, Vy, X, Y, thresholdMin, thresholdMax)

    [h, w] = size(Vx);
    
    for i = 1:1:h
       for j = 1:1:w
           v = sqrt(Vx(i, j)^2 + Vy(i, j)^2);
           
           if ~(v < thresholdMax && v > thresholdMin)
               X(i, j) = nan;
               Y(i, j) = nan;
           end
       end
    end

end