function [] = displayDifferences(imagesSequence, format)

    numberOfImages = imagesSequence.getNumberOfElements();
    
    [n, m] = getSubplotSize(numberOfImages - 1, format);

    figure();
    colormap jet;

    for i = 1:1:numberOfImages - 1
        
        subaxis(n, m, i,'Spacing', 0.04, 'Padding', 0.0, 'Margin', 0.04);
        
        image1 = imagesSequence.getElement(i);
        image2 = imagesSequence.getElement(i + 1);
        
        imshowpair(image1, image2);
        axis image;  axis off;
        title(strcat('Difference(', num2str(i), ',', num2str(i+1),')'));
        
    end

end