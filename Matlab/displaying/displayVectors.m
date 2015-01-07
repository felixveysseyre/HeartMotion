function [] = displayVectors(imagesSequence, velocitiesXSequence, velocitiesYSequence, thresholdMin, thresholdMax, format)

    numberOfImages = imagesSequence.getNumberOfElements();
    size = imagesSequence.getSizeOfElements();
    
    [n, m] = getSubplotSize(numberOfImages - 1, format);
    [X, Y] = meshgrid(1:1:size(2), 1:1:size(1));

    figure();
    colormap gray;

    for i = 1:1:numberOfImages - 1
        
        image = flipud(imagesSequence.getElement(i));
        Vx = flipud(velocitiesXSequence.getElement(i));
        Vy = flipud(velocitiesYSequence.getElement(i));

        [Xtemp, Ytemp] = thresholdField(Vx, Vy, X, Y, thresholdMin, thresholdMax);

        subplot(m, n, i);
        
        hold on; 
        imagesc(image); axis image;
        quiver(Xtemp, Ytemp, Vx, Vy, 'r'); axis image;
    end

end