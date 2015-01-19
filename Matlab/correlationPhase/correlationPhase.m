function [velocitiesXSequence, velocitiesYSequence] = correlationPhase(imagesSequence, blockSize)

    velocitiesXSequence = sequence();
    velocitiesYSequence = sequence();
    
    imageSize = imagesSequence.getSizeOfElements();
    
    halfBlockSize = (blockSize - 1) / 2;

    iMin = 1 + halfBlockSize;
    jMin = 1 + halfBlockSize;
    
    iMax = imageSize(1) - halfBlockSize;
    jMax = imageSize(2) - halfBlockSize;
    
    iStep = 1;
    jStep = 1;

    for i = 1:1:imagesSequence.getNumberOfElements()-1
        
        %% Initialization %%
        
        image1 = imagesSequence.getElement(i);
        image2 = imagesSequence.getElement(i + 1);

        Vx = zeros(imageSize);
        Vy = zeros(imageSize);

        %% Algorithm %%
        
        for i = iMin:iStep:iMax
            
            for j = jMin:jStep:jMax
                
                blockCenter = [i, j];
                
                block1 = getBlock(image1, blockCenter, blockSize);
                block2 = getBlock(image2, blockCenter, blockSize);
                
                correlation = getCorrelationPhase(block1, block2);
                
                motionVector = getMotionVector(correlation, blockSize, blockCenter);
                
                Vx(i, j) = motionVector(2);
                Vy(i, j) = motionVector(1);
                
            end
            
        end
        
        %% Saveing %%
        
        velocitiesXSequence.addElement(Vy);
        velocitiesYSequence.addElement(Vx);
        
    end

end

