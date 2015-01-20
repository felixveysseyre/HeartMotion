function [scaledImage] = scaleImage(image, scalingFactor)

    imageSize = size(image);
    imageMax = max(image(:));

    i0 = round(imageSize(1) / 2);
    j0 = round(imageSize(2) / 2);

    scaledImage = zeros(imageSize);

    for i = 1:1:imageSize(1)

        for j = 1:1:imageSize(2)

            if image(i, j) == imageMax

                i2 = round((i - i0) * scalingFactor + i0); 
                j2 = round((j - j0) * scalingFactor + j0);   

                scaledImage(i2, j2) = imageMax;        

            end

        end

    end
    
end