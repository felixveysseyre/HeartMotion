function [image] = createRingImage(h, w, Ra, Rb, vIn, vOut, blurRatio)

    %% Initialization %%
    
    image = vOut*ones(h, w); 
    
    iC = round(h / 2);
    jC = round(w / 2);

    %% Drawing ring %% 

    for i = 1:1:h

        for j = 1:1:w

            dist = sqrt((iC - i)^2 + (jC - j)^2);

            if dist > Ra && dist < Rb
                
                image(i, j) = vIn;
                
            end

        end

    end
    
    %% Bluring %%
    
    if blurRatio ~= 0
        
        blurSize = round(blurRatio * min(h, w));
    
        window = getWindow(blurSize, 'gaussian');

        image = conv2(image, window, 'same');
        
    end

end

