function [] = displaySequence(imagesSequence, format)

    numberOfImages = imagesSequence.getNumberOfElements();
    
    [n, m] = getSubplotSize(numberOfImages, format);

    figure();
    colormap gray;

    for i = 1:1:numberOfImages
        
        subaxis(n, m, i,'Spacing', 0.04, 'Padding', 0.0, 'Margin', 0.04);
        
        image = imagesSequence.getElement(i);
        imagesc(image); axis image; axis off;
        title(strcat('Sequence(', num2str(i),')'));
        
    end

end