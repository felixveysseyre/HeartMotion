function [Dx] = imageDifferentialX(image1, image2)

    Mx = 1/2 * [0 , 0, 0;
                0, -1, +1;
                0, -1, +1];

    Dx = conv2(1/2 * (image1 + image2), Mx, 'same');
            
end

