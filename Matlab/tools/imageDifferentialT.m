function [Dt] = imageDifferentialT(image1, image2)

    Mt = 1/2 * [0 , 0, 0;
                0, +1, +1;
                0, +1, +1];

    Dt = conv2(1/2 * (image2 - image1), Mt, 'same');
            
end