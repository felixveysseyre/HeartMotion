function [] = displayBlockMatchingParemetersInfluence(imagesSequence, velocitiesXSequences, velocitiesYSequences, blockSizes, overlaying)

    numberOfBlockSizes = length(blockSizes);
    image = imagesSequence.getElement(1);
    
    figure();

    for i = 1:1:numberOfBlockSizes
        Vx = velocitiesXSequences{i}.getElement(1);
        Vy = velocitiesYSequences{i}.getElement(1);
        
        norm = sqrt(Vx .* Vx + Vy .* Vy);
        
        if overlaying
            norm = imfuse(image, norm, 'ColorChannels', [1, 2, 2]);
        end
        
        subaxis(1, numberOfBlockSizes, i, 'Spacing', 0.04, 'Padding', 0.0, 'Margin', 0.04);
        
        if ~overlaying
            colormap jet;
        else
            colormap gray;
        end
        
        imagesc(norm); axis image; axis off;
        title(strcat('Norm(1, 2)', ', ', 'blockSize = ', num2str(blockSizes{i})));
        
    end

end