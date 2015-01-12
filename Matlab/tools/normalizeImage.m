function [normalizedImage] = normalizeImage(image)

    normalizedImage = image - min(image(:));
    normalizedImage = normalizedImage / max(normalizedImage(:));

end