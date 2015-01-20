function [image] = createEllipseImage(h, w, Ra, Rb, e, vIn, vOut)

    %% Initialization %%
    
    image = vOut * ones(h, w); 
    
    i0 = round(h / 2);
    j0 = round(w / 2);

    %% Drawing ellipse %% 

    for i = 1:1:h

        for j = 1:1:w

            dist1 = sqrt((((i0 - i) / Ra)^2 + ((j0 - j) / Rb)^2));
            dist2 = sqrt((((i0 - i) / (Ra + e))^2 + ((j0 - j) / (Rb + e))^2));

            if dist1 > 1 && dist2 < 1 
                
                image(i, j) = vIn;
                
            end

        end

    end
    
end