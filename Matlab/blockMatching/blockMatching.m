function [velocitiesXSequence, velocitiesYSequence] = blockMatching(imagesSequence, blockSize)

    velocitiesXSequence = sequence();
    velocitiesYSequence = sequence();
    
    W = 7; %To generalize

    for i = 1:1:imagesSequence.getNumberOfElements()-1
        
        %% Initialization %%
        
        image1 = imagesSequence.getElement(i);
        image2 = imagesSequence.getElement(i+1);
        
        size = imagesSequence.getSizeOfElements();
        h = size(1);
        w = size(2);

        %% Algorithm %%
        
        Vx = zeros(size);
        Vy = zeros(size);

        if W == 7
            stepSize = [4, 2, 1];
        end

        halfBlockSize = (blockSize - 1) / 2;

        iMin = 1 + halfBlockSize;
        jMin = 1 + halfBlockSize;

        iMax = h - halfBlockSize;
        jMax = w - halfBlockSize;

        iStep = 1;
        jStep = 1;

        for i = iMin:iStep:iMax
            
            for j = jMin:jStep:jMax

                blockCenter = [i, j];
                block2 = getBlock(image2, blockCenter, blockSize);

                closestBlockCenter = getClosestBlock(block2, image1, blockCenter, stepSize(1));
                closestBlockCenter = getClosestBlock(block2, image1, closestBlockCenter, stepSize(2));
                closestBlockCenter = getClosestBlock(block2, image1, closestBlockCenter, stepSize(3));

                motionVector = blockCenter - closestBlockCenter;

                Vx(i, j) = -motionVector(2);
                Vy(i, j) = -motionVector(1);    

            end
            
        end
        
        %% Saveing %%
        
        velocitiesXSequence.addElement(Vx);
        velocitiesYSequence.addElement(Vy);
        
    end
    
end

