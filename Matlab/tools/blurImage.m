function [blurredImage] = blurImage(image, blurRatio)

    if blurRatio ~= 0
        
        [h, w] = size(image); 
        
        blurredImage = zeros(size(image));

        blurSize = round(blurRatio * min(h, w));

        window = getWindow(blurSize, 'gaussian');

        blurredImage = conv2(image, window, 'same');

    else
        
        blurredImage = image;
        
    end

end