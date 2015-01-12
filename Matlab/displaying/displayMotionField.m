function [] = displayMotionField(imagesSequence, velocitiesXSequence, velocitiesYSequence, format)

    numberOfImages = imagesSequence.getNumberOfElements();
    size = imagesSequence.getSizeOfElements();
    
    [n, m] = getSubplotSize(numberOfImages - 1, format);
    [X, Y] = meshgrid(1:1:size(2), 1:1:size(1));
    
    X = flipud(X);
    Y = flipud(Y);

    figure();
    colormap gray;

    for i = 1:1:numberOfImages - 1
        
        image = imagesSequence.getElement(i+1);
        Vx = velocitiesXSequence.getElement(i);
        Vy = velocitiesYSequence.getElement(i);

        [Xtemp, Ytemp] = autoThresholdField(Vx, Vy, X, Y);
 
        subplot(m, n, i);         
        hold on; 
        imagesc(flipud(image)); axis image;
        quiver(Xtemp, Ytemp, Vx, Vy, 'r'); axis image; axis off;
        title(strcat('Motionfield(', num2str(i), ',', num2str(i+1),')'));
        
    end

end