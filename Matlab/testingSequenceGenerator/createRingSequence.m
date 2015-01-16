function [imagesSequence, velocitiesXSequence, velocitiesYSequence] = createRingSequence(h, w, Ra, Rb, vIn, vOut, delta, blurRatio, noiseRatio, vMin, vMax)

    imagesSequence = sequence();
    velocitiesXSequence = sequence();
    velocitiesYSequence = sequence();

    %% Computing %%

    image1 = createRingImage(h, w, Ra, Rb, vIn, vOut, blurRatio);
    image2 = createRingImage(h, w, Ra - delta, Rb, vIn, vOut, blurRatio);
    
    mu = 0;
    sigma = noiseRatio * (vMax - vMin);
    
    image1Noised = addNoiseToImage(image1, mu, sigma, vMin, vMax);
    image2Noised = addNoiseToImage(image2, mu, sigma, vMin, vMax);
    
    %imagesc(image1Noised);

    [Vx, Vy] = createMotionFieldForRingImages(h, w, image1, image2);
    
    %% Saving %%
    
    imagesSequence.addElement(image1Noised);
    imagesSequence.addElement(image2Noised);
    
    velocitiesXSequence.addElement(Vx);
    velocitiesYSequence.addElement(Vy);
    
end