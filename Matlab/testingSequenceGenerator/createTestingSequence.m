function [imagesSequence, velocitiesXSequence, velocitiesYSequence] = createTestingSequence (imageSize, formType, formParameters, transformationType, transformationParameters, postProcessingParameters)

    % Form %
    
    % formType = 'ring', 'ellipse' or 'square'
    % formParameters = [R, e, vIn, vOut] for ring
    %                = [Ra, Rb, e vIn, vOut] for ellipse   
    %                = [a, b, e, vIn, vOut] for square
    
    % Transformation %
    
    % transformationType = 'scaling', 'translation' or 'rotation'
    % transformationParameters = [scalingFactor] for scaling
    %                          = [a, b] for translation
    %                          = [angle] for rotation (in degrees)
    
    % PostProcessing %
    
    % postProcessingParameters = [blurRatio, noiseRatio, vMin, vMax]

    %% Initialization %%

    imagesSequence = sequence();
    velocitiesXSequence = sequence();
    velocitiesYSequence = sequence();
    
    image1 = zeros(imageSize); 
    image2 = zeros(imageSize); 
    
    %% Image %%

    h = imageSize(1);
    w = imageSize(2);
    
    if strcmp(formType, 'ring')
        
        R = formParameters(1); 
        e = formParameters(2);
        vIn = formParameters(3);
        vOut = formParameters(4);
        image1 = createRingImage(h, w, R, e, vIn, vOut);
        
    elseif strcmp(formType, 'ellipse')
        Ra = formParameters(1); 
        Rb = formParameters(2);
        e = formParameters(3);
        vIn = formParameters(4);
        vOut = formParameters(5);
        image1 = createEllipseImage(h, w, Ra, Rb, e, vIn, vOut);
        
    elseif strcmp(formType, 'square')
        
        a = formParameters(1); 
        b = formParameters(2);
        e = formParameters(3);
        vIn = formParameters(4);
        vOut = formParameters(5);        
        image1 = createSquareImage(h, w, a, b, e, vIn, vOut);
    end
    
    
    %% Transformation %%

    if strcmp(transformationType, 'scaling')
        
        scalingFactor = transformationParameters(1);
        image2 = scaleImage(image1, scalingFactor); 
        
        [Vx, Vy] = createMotionFieldForScaling(h, w, image1, image2);
        
    elseif strcmp(transformationType, 'translation')
        
        a = transformationParameters(1);
        b = transformationParameters(2);
        translationVector = [a, b];
        image2 = imtranslate(image1, translationVector);
        
        [Vx, Vy] = createMotionFieldForTranslation(h, w, image1, image2, translationVector);
        
    elseif strcmp(transformationType, 'rotation')
        
        angle = transformationParameters(1);
        image2 = imrotate(image1, angle, 'nearest', 'crop');
        
        [Vx, Vy] = createMotionFieldForRotation(h, w, image1, image2);
        
    end

    
    %% Post-Processing %%
    
    blurRatio = postProcessingParameters(1);
    noiseRatio = postProcessingParameters(2);
    
    vMin = postProcessingParameters(3);
    vMax = postProcessingParameters(4);
    
    mu = 0;
    sigma = noiseRatio * (vMax - vMin);

    image1 = blurImage(image1, blurRatio);
    image2 = blurImage(image2, blurRatio);
    
    image1 = addNoiseToImage(image1, mu, sigma, vMin, vMax);
    image2 = addNoiseToImage(image2, mu, sigma, vMin, vMax);
    
        
    %% Saving %%
    
    imagesSequence.addElement(image1);
    imagesSequence.addElement(image2);
    
    velocitiesXSequence.addElement(Vx);
    velocitiesYSequence.addElement(Vy);

end