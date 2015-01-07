function [] = displayDifferences(imagesSequence, format)

    numberOfImages = imagesSequence.getNumberOfElements();
    
    [n, m] = getSubplotSize(numberOfImages - 1, format);

    figure();
    colormap gray;

    for i = 1:1:numberOfImages - 1
        
        subplot(m, n, i);
        
        image1 = imagesSequence.getElement(i);
        image2 = imagesSequence.getElement(i + 1);
        difference = abs(image2 - image1);
        
        imagesc(difference);
        axis image;
        
    end

end