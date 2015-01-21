function [EPESequence] = computeEPE(theoricalVelocitiesXSequence, theoricalVelocitiesYSequence, experimentalVelocitiesXSequence, experimentalVelocitiesYSequence)

    EPESequence = sequence();  

    for i = 1:1:theoricalVelocitiesXSequence.getNumberOfElements()

        theoricalVx = theoricalVelocitiesXSequence.getElement(i);
        theoricalVy = theoricalVelocitiesYSequence.getElement(i);

        experimentalVx = experimentalVelocitiesXSequence.getElement(i);
        experimentalVy = experimentalVelocitiesYSequence.getElement(i);

        diffVx = theoricalVx - experimentalVx;
        diffVy = theoricalVy - experimentalVy;

        EPE = sqrt(diffVx .^ 2 + diffVy .^ 2);

        EPESequence.addElement(EPE);

    end

end