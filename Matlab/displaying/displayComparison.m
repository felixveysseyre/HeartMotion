function [] = displayComparison(imagesSequence, velocitiesXSequence, velocitiesYSequence, format)

    numberOfImages = imagesSequence.getNumberOfElements();
    
    [n, m] = getSubplotSize(numberOfImages - 1, format);
    
    figure();
    colormap jet;

    for i = 1:1:numberOfImages-1

        image1 = imagesSequence.getElement(i);
        image2 = imagesSequence.getElement(i + 1);
        
        Vx = velocitiesXSequence.getElement(i);
        Vy = velocitiesYSequence.getElement(i);
        
        difference = abs(image2 - image1);
        norm = sqrt(Vx .* Vx + Vy .* Vy);
        
        norm = normalizeImage(norm);
        difference = normalizeImage(difference);
        
        comparison = abs(difference - norm);
        
        subplot(m, n, i);
        imagesc(comparison);
        axis equal; axis image; axis off;
        title(strcat('Comparison(', num2str(i), ',', num2str(i+1),')'));
        
    end

end