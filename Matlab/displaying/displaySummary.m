function [] = displaySummary(imagesSequence, velocitiesXSequence, velocitiesYSequence, quiverFactor, autoTresholding)

    numberOfImages = imagesSequence.getNumberOfElements();
    size = imagesSequence.getSizeOfElements();
    
    [X, Y] = meshgrid(1:1:size(2), 1:1:size(1));
    
    m = numberOfImages - 1;
    n = 4;
    
    for i = 1:1:numberOfImages - 1
        
        % Values %
        
        image1 = imagesSequence.getElement(i);
        image2 = imagesSequence.getElement(i + 1);
        Vx = velocitiesXSequence.getElement(i);
        Vy = velocitiesYSequence.getElement(i);

        [Xd, Yd, Vxd, Vyd] = dessimateMotionField(X, Y, Vx, Vy, quiverFactor);
        
        if autoTresholding == 1
            [Xd, Yd] = autoThresholdField(Vxd, Vyd, Xd, Yd);
        end
        
        % Motion field %

        subaxis(n, m, 0 * m + i,'Spacing', 0.04, 'Padding', 0.0, 'Margin', 0.04);
        hold on;
        colormap gray;
        imagesc(image2); axis image; axis ij; axis off;
        quiver(Xd, Yd, Vyd, Vxd, 'r'); axis image; axis ij; axis off;
        title(strcat('Motionfield(', num2str(i), ',', num2str(i+1),')'));
        
        % Norm %
        
        norm = sqrt(Vx .* Vx + Vy .* Vy);
        
        subaxis(n, m, 1 * m + i,'Spacing', 0.04, 'Padding', 0.0, 'Margin', 0.04);
        colormap jet;
        imagesc(norm); axis image; axis off;
        title(strcat('Norm(', num2str(i), ',', num2str(i+1),')'));
        
        % Differences %
        
        difference = abs(image2 - image1);
        
        subaxis(n, m, 2 * m + i,'Spacing', 0.04, 'Padding', 0.0, 'Margin', 0.04);
        colormap jet;
        imagesc(difference); axis image; axis off;
        title(strcat('Difference(', num2str(i), ',', num2str(i+1),')'));
        
        % Comparison %
        
        comparison = abs(zscore(difference) - zscore(norm));
        
        subaxis(n, m, 3 * m + i,'Spacing', 0.04, 'Padding', 0.0, 'Margin', 0.04);
        colormap jet;
        imagesc(comparison); axis image; axis off;
        title(strcat('Comparison(', num2str(i), ',', num2str(i+1),')'));
        
    end

end