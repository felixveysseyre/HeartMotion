function [] = displayNorm(imagesSequence, velocitiesXSequence, velocitiesYSequence, format, overlaying)

    numberOfImages = imagesSequence.getNumberOfElements();
    
    [n, m] = getSubplotSize(numberOfImages - 1, format);
    
    figure();
    colormap jet;

    for i = 1:1:numberOfImages-1
        
        image = imagesSequence.getElement(i);

        Vx = velocitiesXSequence.getElement(i);
        Vy = velocitiesYSequence.getElement(i);
        
        norm = sqrt(Vx .* Vx + Vy .* Vy);
        
        if overlaying
            norm = imfuse(image, norm, 'ColorChannels', [1, 2, 2]);
        end
        
        subaxis(n, m, i, 'Spacing', 0.04, 'Padding', 0.0, 'Margin', 0.04);
        
        if ~overlaying
            colormap jet;
        else
            colormap gray;
        end
        
        imagesc(norm);
        axis equal; axis image; axis off;
        title(strcat('Norm(', num2str(i), ',', num2str(i+1),')'));
        
    end

end