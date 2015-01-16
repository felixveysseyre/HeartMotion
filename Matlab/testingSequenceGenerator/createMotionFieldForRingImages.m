function [Vx, Vy] = createMotionFieldForRingImages(h, w, image1, image2)

    %% Initialization %% 
    
    Vx = zeros(h, w);
    Vy = zeros(h, w);

    iC = round(h / 2);
    jC = round(w / 2);

    diff = image1 - image2; 

    %% Computing Motion Field %% 

    for i = 1:1:h

        for j = 1:1:w

            if diff(i, j) ~= 0

                vector = [iC - i, jC - j]; 
                vector = vector ./ norm(vector); 

                Vx(i, j) = vector(1);
                Vy(i, j) = vector(2);
                
            end

        end
    end

end

