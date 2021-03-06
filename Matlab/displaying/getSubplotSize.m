function [n, m] = getSubplotSize(numberOfImages, format)

    if numberOfImages == 1
        n = 1;
        m = 1;
    else
        n = floor(sqrt(format * numberOfImages));
        m = round(numberOfImages / n);
    end

end

