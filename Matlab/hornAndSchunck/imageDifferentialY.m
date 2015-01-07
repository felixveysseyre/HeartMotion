function [Dy] = imageDifferentialY(image1, image2)

    My = 1/2 * [0 , 0, 0;
                0, -1, -1;
                0, +1, +1];

    Dy = conv2( 1/2 * (image1 + image2), My, 'same');
            
end