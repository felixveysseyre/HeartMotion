function [] = displayResults(imagesSequence, velocitiesXSequence, velocitiesYSequence, thresholdMin, thresholdMax)

    numberOfImages = imagesSequence.getNumberOfElements();
    
    n = ceil(sqrt(format*numberOfImages));
    m = ceil(sqrt(1/format*numberOfImages));
    
    size = imagesSequence.getSizeOfElements();
    [X, Y] = meshgrid(1:1:size(2), 1:1:size(1));

    for i = 1:1:numberOfImages-1

        Vx = velocitiesXSequence.getElement(i);
        Vy = velocitiesYSequence.getElement(i);
        
        figure();
        colormap gray;
        
        subplot(m, n, i); imagesc(sqrt(Vx .* Vx + Vy .* Vy));  axis equal; axis image;

        figure();
        colormap gray;

        [Xtemp, Ytemp] = thresholdField(Vx, Vy, X, Y, thresholdMin, thresholdMax);

        imagesc(image1); axis image;
        hold on; quiver(Xtemp, Ytemp, Vx, Vy, 'r'); axis image;
    end

end