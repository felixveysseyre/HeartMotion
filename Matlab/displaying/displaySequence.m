function [] = displaySequence(imagesSequence, format)

    numberOfImages = imagesSequence.getNumberOfElements();

    colormap gray;
    
    n = ceil(sqrt(format*numberOfImages));
    m = ceil(sqrt(1/format*numberOfImages));

    for i = 1:1:numberOfImages
        
        subplot(m, n, i);
        
        image = imagesSequence.getElement(i);
        imagesc(image); axis image;
        
    end

end