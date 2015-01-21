function [] = displayNormAndPhaseErrors(theoricalNormSequence, experimentalNormSequence, errorNormSequence, theoricalPhaseSequence, experimentalPhaseSequence, errorPhaseSequence)

    for i = 1:1:theoricalNormSequence.getNumberOfElements()

        theoricalNorm = theoricalNormSequence.getElement(i);
        experimentalNorm = experimentalNormSequence.getElement(i);
        errorNorm = errorNormSequence.getElement(i);

        theoricalPhase = theoricalPhaseSequence.getElement(i);
        experimentalPhase = experimentalPhaseSequence.getElement(i);
        errorPhase = errorPhaseSequence.getElement(i);

        minNormImages = 0;

        maxNormImages = max([max(theoricalNorm(:))...
            max(experimentalNorm(:))...
            max(errorNorm(:))]);

        minPhaseImages = min([min(theoricalPhase(:))...
            min(experimentalPhase(:))...
            min(errorNorm(:))]);

        maxPhaseImages = max([ max(theoricalPhase(:))...
            max(experimentalPhase(:))...
            max(errorNorm(:))]);

        figure();
        colormap jet;
        
        subaxis(2, 3, 1, 'Spacing', 0.04, 'Padding', 0.0, 'Margin', 0.04);
        imagesc(theoricalNorm, [minNormImages, maxNormImages]); colorbar;
        axis image;
        title('Theorical Norm');
        
        subaxis(2, 3, 2, 'Spacing', 0.04, 'Padding', 0.0, 'Margin', 0.04);
        imagesc(experimentalNorm, [minNormImages, maxNormImages]); colorbar;
        axis image;
        title('Experimental Norm');
        
        subaxis(2, 3, 3, 'Spacing', 0.04, 'Padding', 0.0, 'Margin', 0.04);
        imagesc(errorNorm, [minNormImages, maxNormImages]); colorbar;
        axis image;
        title('Error Norm');
        
        subaxis(2, 3, 4, 'Spacing', 0.04, 'Padding', 0.0, 'Margin', 0.04);
        imagesc(theoricalPhase, [minPhaseImages, maxPhaseImages]); colorbar;
        axis image;
        title('Theorical Phase');
        
        subaxis(2, 3, 5, 'Spacing', 0.04, 'Padding', 0.0, 'Margin', 0.04);
        imagesc(experimentalPhase, [minPhaseImages, maxPhaseImages]); colorbar;
        axis image;
        title('Experimental Phase');
        
        subaxis(2, 3, 6, 'Spacing', 0.04, 'Padding', 0.0, 'Margin', 0.04);
        imagesc(errorPhase, [minPhaseImages, maxPhaseImages]); colorbar;
        axis image;
        title('Error Phase');
        
    end
    
end