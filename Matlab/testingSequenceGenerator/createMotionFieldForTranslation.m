function [Vx, Vy] = createMotionFieldForTranslation(h, w, image1, image2, translationVector)

    Vx = zeros(h, w);
    Vy = zeros(h, w);
    
    translationVector = translationVector ./ norm(translationVector);
    
    %% Computing Motion Field %%
    
    for i = 1:1:h
        
        for j = 1:1:w
            
            if image1(i, j) ==  max(image1(:)) || image2(i, j) == max(image2(:))
                
                vector = translationVector;              
                Vx(i, j) = vector(1);
                Vy(i, j) = vector(2);
                
            end
            
        end
        
    end
    
end