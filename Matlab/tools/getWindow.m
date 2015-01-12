function [window] = getWindow(size, windowType)

    if strcmp(windowType, 'uniform')
        
        w = ones(size, 1);
        window = w * w';
        
    elseif strcmp(windowType, 'gaussian')
        
        w = gausswin(size);
        window = w * w';
        
    else
        
        'WARNING: windowType argument is not valid'
        
    end

end