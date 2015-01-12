function [X, Y] = autoThresholdField(Vx, Vy, X, Y)

    [h, w] = size(Vx);
    
    norm = sqrt(Vx .* Vx + Vy .* Vy);
    
    thresholdedNorm = imquantize(norm, multithresh(norm, 5));
    
    for i = 1:1:h
       for j = 1:1:w
           if thresholdedNorm(i, j) < 2
               X(i, j) = nan;
               Y(i, j) = nan;
           end
       end
    end

end