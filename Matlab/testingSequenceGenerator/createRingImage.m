function [image] = createRingImage(h, w, R, e, vIn, vOut)

    %% Initialization %%
    
    image = vOut * ones(h, w); 
    
    i0 = round(h / 2);
    j0 = round(w / 2);

    %% Drawing ring %% 

    for i = 1:1:h

        for j = 1:1:w

            dist = sqrt((i0 - i)^2 + (j0 - j)^2);

            if dist > R && dist < R + e
                
                image(i, j) = vIn;
                
            end

        end

    end
    
end