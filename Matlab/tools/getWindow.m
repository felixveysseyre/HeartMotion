function [window] = getWindow(size, windowType)

    if strcmp(windowType, 'uniform')
        
        w = ones(size, 1);
        
    elseif strcmp(windowType, 'gaussian')
        
        w = gausswin(size);
        
    elseif strcmp(windowType, 'hamming')
        
        w = hamming(size);
        
    else
        
        'WARNING: windowType argument is not valid'
        
    end
    
    window = w * w';
    window = window ./ sum(window(:));

end