function [Vx, Vy] = createMotionFieldForRotation(h, w, image1, image2)

    Vx = zeros(h, w);
    Vy = zeros(h, w);

    i0 = round(h / 2);
    j0 = round(w / 2);

    %% Computing Motion Field %%

    for i = 1:1:h

        for j = 1:1:w

            if xor(image1(i, j) == max(image1(:)), image2(i, j) == max(image2(:)))

                vector = zeros(1, 2);

                if j < j0

                    slope = (i - i0)/(j - j0);
                    vector = [1, -slope];

                elseif j > j0

                    slope = (i - i0)/(j - j0);
                    vector = -[1, -slope];

                elseif j == j0 && i > i0

                    vector = [0, 1];

                elseif j == j0 && i < i0

                    vector = [0, -1];

                end

                vector = vector ./ norm(vector);

                Vx(i, j) = vector(1);
                Vy(i, j) = vector(2);
                
            end
            
        end
        
    end
    
end


