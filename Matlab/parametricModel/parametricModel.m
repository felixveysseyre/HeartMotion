function [velocitiesXSequence, velocitiesYSequence] = parametricModel(imagesSequence, blockSize, windowType)

    if mod(blockSize, 2) == 1
        
        window = getWindow(blockSize, windowType);
        
        l = (blockSize - 1) / 2;
        
        velocitiesXSequence = sequence();
        velocitiesYSequence = sequence();

        for i = 1:1:imagesSequence.getNumberOfElements()-1

            %% Initialization %%

            image1 = imagesSequence.getElement(i + 1);
            image2 = imagesSequence.getElement(i);

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
                    W = [];
                    
                    % Create A & B %

                    for i2 = (i - l):1:(i + l)
                        if i2 >= 1 && i2 <= size(1)
                            for j2 = (j - l):1:(j + l)
                                if j2 >= 1 && j2 <= size(2)
                                    
                                    x = i2 - i + 1;
                                    y = j2 - j + 1;
                                    
                                    A = [A; [Dx(i2, j2) * [1, x, y], Dy(i2, j2) * [1, x, y]]];
                                    B = [B; -Dt(i2, j2)];
                                    W = [W; window(i2 - i + l + 1, j2 - j + l + 1)];
                                end
                            end
                        end
                    end
                    
                    % Solve for U %
                    
                    W = diag(W);
                    
                    A;
                    
                    B;
                    
                    %P = pinv(A) * B;
                    P = pinv(W * A) * W * B;
                    
                    P = reshape(P, 2, 3);
                    
                    U = P * [1; 1; 1];
                    
                    % Store result %
                    
                    Vx(i, j) = U(1, 1);
                    Vy(i, j) = U(2, 1);

                end

            end

            %% Saveing %%

            velocitiesXSequence.addElement(Vy);
            velocitiesYSequence.addElement(Vx);

        end
        
    else
        
        'WARNING: Block size has to be odd'
        
    end

    

end