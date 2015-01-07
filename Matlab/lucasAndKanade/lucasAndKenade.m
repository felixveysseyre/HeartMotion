function [velocitiesXSequence, velocitiesYSequence] = lucasAndKenade(imagesSequence, blockSize)

    if mod(blockSize, 2) == 1
        
        l = (blockSize - 1) / 2;
        
        velocitiesXSequence = sequence();
        velocitiesYSequence = sequence();

        for i = 1:1:imagesSequence.getNumberOfElements()-1

            %% Initialization %%

            image1 = imagesSequence.getElement(i);
            image2 = imagesSequence.getElement(i+1);

            size = imagesSequence.getSizeOfElements();

            Vx = zeros(size);
            Vy = zeros(size);

            Dx = imageDifferentialX(image1, image2);
            Dy = imageDifferentialY(image1, image2);
            Dt = imageDifferentialT(image1, image2);

            %% Iterative method %%

            for i = 1:1:size(1)

                for j = 1:1:size(2)
                    
                    A = [];
                    B = [];
                    
                    % Create A & B %

                    for i2 = (i - l):1:(i + l)
                        if i2 >= 1 && i2 <= size(1)
                            for j2 = (j - l):1:(j + l)
                                if j2 >= 1 && j2 <= size(2)
                                    A = [A; [Dx(i2, j2), Dy(i2, j2)]];
                                    B = [B; -Dt(i2, j2)];
                                end
                            end
                        end
                    end
                    
                    % Solve for U %
                    
                    %U = inv(A' * A) * A' * B;
                    U = (A' * A) \ A' * B;
                    
                    % Store result %
                    
                    Vx(i, j) = U(1, 1);
                    Vy(i, j) = U(2, 1);

                end

            end

            %% Saveing %%

            velocitiesXSequence.addElement(Vx);
            velocitiesYSequence.addElement(Vy);

        end
        
    else
        
        'WARNING: Block size has to be odd'
        
    end

    

end