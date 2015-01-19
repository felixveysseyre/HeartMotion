function [] = displayMotionField(imagesSequence, velocitiesXSequence, velocitiesYSequence, format, quiverFactor, autoTresholding)

    numberOfImages = imagesSequence.getNumberOfElements();
    imageSize = imagesSequence.getSizeOfElements();
    
    [n, m] = getSubplotSize(numberOfImages - 1, format);
    [X, Y] = meshgrid(1:1:imageSize(2), 1:1:imageSize(1));

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
 
        subaxis(n, m, i,'Spacing', 0.04, 'Padding', 0.0, 'Margin', 0.04);       
        hold on; 
        imagesc(image); axis image; axis ij; axis off;
        quiver(Xd, Yd, Vyd, Vxd, 'r'); axis image; axis ij; axis off;
        title(strcat('Motionfield(', num2str(i), ',', num2str(i+1),')'));
        
    end

end