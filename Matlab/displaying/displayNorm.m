function [] = displayNorm(imagesSequence, velocitiesXSequence, velocitiesYSequence, format)

    numberOfImages = imagesSequence.getNumberOfElements();
    
    [n, m] = getSubplotSize(numberOfImages - 1, format);
    
    figure();
    colormap jet;

    for i = 1:1:numberOfImages-1

        Vx = velocitiesXSequence.getElement(i);
        Vy = velocitiesYSequence.getElement(i);
        
        norm = sqrt(Vx .* Vx + Vy .* Vy);
        
        subplot(m, n, i);
        imagesc(norm);
        axis equal; axis image; axis off;
        title(strcat('Norm(', num2str(i), ',', num2str(i+1),')'));
        
    end

end