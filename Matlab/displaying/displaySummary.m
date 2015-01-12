function [] = displaySummary(imagesSequence, velocitiesXSequence, velocitiesYSequence, thresholdMin, thresholdMax)

    numberOfImages = imagesSequence.getNumberOfElements();
    size = imagesSequence.getSizeOfElements();
    
    [X, Y] = meshgrid(1:1:size(2), 1:1:size(1));
    
    X = flipud(X);
    Y = flipud(Y);
    
    m = numberOfImages - 1;
    n = 4;
    
    for i = 1:1:numberOfImages - 1
        
        % Values %
        
        image1 = imagesSequence.getElement(i);
        image2 = imagesSequence.getElement(i + 1);
        Vx = velocitiesXSequence.getElement(i);
        Vy = velocitiesYSequence.getElement(i);

        [Xtemp, Ytemp] = thresholdField(Vx, Vy, X, Y, thresholdMin, thresholdMax);
        
        % Motion field %

        subplot(n, m, 0 * m + i);
        hold on;
        colormap gray;
        imagesc(flipud(image2)); axis image; axis off;
        quiver(Xtemp, Ytemp, Vx, Vy, 'r'); axis image; axis off;
        title(strcat('Motionfield(', num2str(i), ',', num2str(i+1),')'));
        
        % Norm %
        
        norm = sqrt(Vx .* Vx + Vy .* Vy);
        
        subplot(n, m, 1 * m + i);
        colormap jet;
        imagesc(norm); axis image; axis off;
        title(strcat('Norm(', num2str(i), ',', num2str(i+1),')'));
        
        % Differences %
        
        difference = abs(image2 - image1);
        
        subplot(n, m, 2 * m + i);
        colormap jet;
        imagesc(difference); axis image; axis off;
        title(strcat('Difference(', num2str(i), ',', num2str(i+1),')'));
        
        % Comparison %
        
        comparison = abs(zscore(difference) - zscore(norm));
        
        subplot(n, m, 3 * m + i);
        colormap jet;
        imagesc(comparison); axis image; axis off;
        title(strcat('Comparison(', num2str(i), ',', num2str(i+1),')'));
        
    end

end