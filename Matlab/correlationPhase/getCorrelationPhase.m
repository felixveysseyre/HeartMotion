function [R] = getCorrelationPhase(block1, block2)

    fftBlock1 = fft2(block1); 
    fftBlock2 = fft2(block2);

    product = fftBlock1 .* conj(fftBlock2);
    productNorm = norm(product);

    if productNorm ~= 0
        fftR = product / norm(product);
    else
        fftR = product;
    end

    R = fftshift(ifft2(fftR));
    % R = ifft2(R_fft);
    
end