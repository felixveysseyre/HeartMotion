function [Vx, Vy] = createMotionFieldForScaling( h, w, image1, image2)

    Vx = zeros(h, w);
    Vy = zeros(h, w);

    i0 = round(h / 2);
    j0 = round(w / 2);
    
    %% Computing Motion Field %%
    
    for i = 1:1:h
        
        for j = 1:1:w
            
            if image1(i, j) ==  max(image1(:)) || image2(i, j) ==  max(image2(:))

                vector = [i0 - i, j0 - j];
                vector = vector ./ norm(vector);
                
                Vx(i, j) = vector(1);
                Vy(i, j) = vector(2);
                
            end
            
        end
        
    end
    
end

