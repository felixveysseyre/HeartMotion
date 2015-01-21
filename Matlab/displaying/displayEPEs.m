function [] = displayEPEs(EPEsSequence, format)

    numberOfEPEs = EPEsSequence.getNumberOfElements();
    
    [n, m] = getSubplotSize(numberOfEPEs, format);

    figure();
    colormap jet;

    for i = 1:1:numberOfEPEs
        
        EPE = EPEsSequence.getElement(i);

        minEPE = 0;
        maxEPE = max(EPE(:));
        
        subaxis(n, m, i,'Spacing', 0.04, 'Padding', 0.0, 'Margin', 0.04);
        imagesc(EPE, [minEPE, maxEPE]); colorbar;
        axis image; axis off;
        title(strcat('EndPointError(', num2str(i),')'));
        
    end

end