function [theoricalNormSequence, experimentalNormSequence, errorNormSequence, theoricalPhaseSequence, experimentalPhaseSequence, errorPhaseSequence] = computeNormAnderrorPhases(theoricalVelocitiesXSequence, theoricalVelocitiesYSequence, experimentalVelocitiesXSequence, experimentalVelocitiesYSequence)

    %% Initialization %%

    theoricalNormSequence = sequence(); 
    experimentalNormSequence = sequence(); 
    errorNormSequence = sequence(); 

    theoricalPhaseSequence = sequence(); 
    experimentalPhaseSequence = sequence(); 
    errorPhaseSequence = sequence(); 

    for i = 1:1:theoricalVelocitiesXSequence.getNumberOfElements()

        theoricalVx = theoricalVelocitiesXSequence.getElement(i);
        theoricalVy = theoricalVelocitiesYSequence.getElement(i);

        experimentalVx = experimentalVelocitiesXSequence.getElement(i);
        experimentalVy = experimentalVelocitiesYSequence.getElement(i);

        [theoricalPhase, theoricalNorm] = cart2pol(theoricalVx, theoricalVy);
        [experimentalPhase, experimentalNorm] = cart2pol(experimentalVx, experimentalVy);

        theoricalNorm = theoricalNorm ./ max(theoricalNorm(:));
        experimentalNorm = experimentalNorm ./ max(experimentalNorm(:));
        
        errorPhase = abs(theoricalPhase - experimentalPhase);
        errorNorm = abs(theoricalNorm - experimentalNorm);

        theoricalNormSequence.addElement(theoricalNorm); 
        experimentalNormSequence.addElement(experimentalNorm); 
        errorNormSequence.addElement(errorNorm);

        theoricalPhaseSequence.addElement(theoricalPhase); 
        experimentalPhaseSequence.addElement(experimentalPhase); 
        errorPhaseSequence.addElement(errorPhase);

    end

end