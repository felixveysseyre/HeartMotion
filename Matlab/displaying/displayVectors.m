function [] = displayVectors(imagesSequence, velocitiesXSequence, velocitiesYSequence, thresholdMin, thresholdMax, format)

    numberOfImages = imagesSequence.getNumberOfElements();
    
    n = ceil(sqrt(format*numberOfImages));
    m = ceil(sqrt(1/format*numberOfImages));

    colormap gray;
    
    size = imagesSequence.getSizeOfElements();
    [X, Y] = meshgrid(1:1:size(2), 1:1:size(1));

    for i = 1:1:numberOfImages-1
        
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