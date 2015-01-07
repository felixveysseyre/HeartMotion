function [Vmean] = velocityMean(V)

    MV = 1/12 * [1, 2, 1;
                 2, 0, 2;
                 1, 2, 1];

    Vmean = conv2(V, MV, 'same');
              
end

