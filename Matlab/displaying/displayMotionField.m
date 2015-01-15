function [] = displayMotionField(imagesSequence, velocitiesXSequence, velocitiesYSequence, format, quiverFactor, autoTresholding)

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
        
        [Xd, Yd, Vxd, Vyd] = dessimateMotionField(X, Y, Vx, Vy, quiverFactor);
        
        if autoTresholding == 1
            [Xd, Yd] = autoThresholdField(Vxd, Vyd, Xd, Yd);
        end
 
        subplot(m, n, i);         
        hold on; 
        imagesc(flipud(image)); axis image;
        quiver(Xd, Yd, -Vxd, Vyd, 'r'); axis image; axis off;
        %quiver(X, Y, -Vx, Vy, 'r'); axis image; axis off;
        title(strcat('Motionfield(', num2str(i), ',', num2str(i+1),')'));
        
    end

end