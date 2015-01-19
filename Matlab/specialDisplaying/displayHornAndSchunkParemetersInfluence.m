function [] = displayHornAndSchunkParemetersInfluence(imagesSequence, velocitiesXSequences, velocitiesYSequences, alphas, overlaying)

    numberOfAlphas = length(alphas);
    image = imagesSequence.getElement(1);
    
    figure();

    for i = 1:1:numberOfAlphas
        Vx = velocitiesXSequences{i}.getElement(1);
        Vy = velocitiesXSequences{i}.getElement(1);
        
        norm = sqrt(Vx .* Vx + Vy .* Vy);
        
        if overlaying
            norm = imfuse(image, norm, 'ColorChannels', [1, 2, 2]);
        end
        
        subaxis(1, numberOfAlphas, i, 'Spacing', 0.04, 'Padding', 0.0, 'Margin', 0.04);
        
        if ~overlaying
            colormap jet;
        else
            colormap gray;
        end
        
        imagesc(norm); axis image; axis off;
        title(strcat('Norm(1, 2)', ', ', 'alpha = ', num2str(alphas{i})));
        
    end

end