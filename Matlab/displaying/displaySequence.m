function [] = displaySequence(imagesSequence, format)

    numberOfImages = imagesSequence.getNumberOfElements();
    
    [n, m] = getSubplotSize(numberOfImages, format);

    figure();
    colormap gray;

    for i = 1:1:numberOfImages
        
        subplot(m, n, i);
        
        image = imagesSequence.getElement(i);
        imagesc(image); axis image; axis off;
        title(strcat('Sequence(', num2str(i),')'));
        
    end

end