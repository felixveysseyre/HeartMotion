function [] = displayResults(imagesSequence, velocitiesXSequence, velocitiesYSequence, format)

    numberOfImages = imagesSequence.getNumberOfElements();
    size = imagesSequence.getSizeOfElements();
    
    [n, m] = getSubplotSize(numberOfImages - 1, format);
    
    figure();
    colormap gray;

    for i = 1:1:numberOfImages-1

        Vx = velocitiesXSequence.getElement(i);
        Vy = velocitiesYSequence.getElement(i);
        
        subplot(m, n, i);
        imagesc(sqrt(Vx .* Vx + Vy .* Vy));
        axis equal; axis image;
        
    end

end