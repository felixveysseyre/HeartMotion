function [window] = getWindow(size, windowType)

    if strcmp(windowType, 'uniform')
        
        w = ones(size, 1);
        window = w * w';
        window = window ./ sum(window(:));
        
        
    elseif strcmp(windowType, 'gaussian')
        
        w = gausswin(size);
        window = w * w';
        window = window ./ sum(window(:));
        
    else
        
        'WARNING: windowType argument is not valid'
        
    end

end