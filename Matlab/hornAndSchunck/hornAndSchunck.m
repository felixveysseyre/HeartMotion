function [velocitiesXSequence, velocitiesYSequence] = hornAndSchunck(imagesSequence, alpha, numberOfIterations)

    velocitiesXSequence = sequence();
    velocitiesYSequence = sequence();

    for i = 1:1:imagesSequence.getNumberOfElements()-1
        
        %% Initialization %%
        
        image1 = imagesSequence.getElement(i + 1);
        image2 = imagesSequence.getElement(i);
        
        size = imagesSequence.getSizeOfElements();

        Vx = zeros(size);
        Vy = zeros(size);

        Dx = imageDifferentialX(image1, image2);
        Dy = imageDifferentialY(image1, image2);
        Dt = imageDifferentialT(image1, image2);
        
        %% Iterative method %%

        for j = 1:1:numberOfIterations

            %% Velocity means %%

            VxMean = velocityMean(Vx);
            VyMean = velocityMean(Vy);

            %% New velocity means %%

            A = Dx .* VxMean + Dy .* VyMean + Dt;
            B = alpha^2 + Dx.^2 + Dy.^2;

            VxTemp = VxMean - Dx .* A ./ B;
            VyTemp = VyMean - Dy .* A ./ B;

            %% Update %%

            Vx = VxTemp;
            Vy = VyTemp;

        end
        
        %% Saveing %%
        
        velocitiesXSequence.addElement(Vy);
        velocitiesYSequence.addElement(Vx);
        
    end

end