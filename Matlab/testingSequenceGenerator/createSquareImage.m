function [image] = createSquareImage(h, w, a, b, e, vIn, vOut)

    %% Initialization %%
    
    image = vOut * ones(h, w); 
    
    i0 = round(h / 2);
    j0 = round(w / 2);

    %% Drawing square %% 

    for i = 1:1:h

        for j = 1:1:w

            if (abs(i - i0) > a && abs(i - i0) < a + e && abs(j - j0) < b + e)...
            || (abs(j - j0) > b && abs(j - j0) < b + e && abs(i - i0) < a + e)
                
                image(i, j) = vIn;
                
            end

        end

    end
    
end