function [EPEsSequence] = computeEPEs(theoricalVelocitiesXSequence, theoricalVelocitiesYSequence, experimentalVelocitiesXSequence, experimentalVelocitiesYSequence)

    EPEsSequence = sequence();  

    for i = 1:1:theoricalVelocitiesXSequence.getNumberOfElements()

        theoricalVx = theoricalVelocitiesXSequence.getElement(i);
        theoricalVy = theoricalVelocitiesYSequence.getElement(i);

        experimentalVx = experimentalVelocitiesXSequence.getElement(i);
        experimentalVy = experimentalVelocitiesYSequence.getElement(i);

        diffVx = theoricalVx - experimentalVx;
        diffVy = theoricalVy - experimentalVy;

        EPE = sqrt(diffVx .^ 2 + diffVy .^ 2);

        EPEsSequence.addElement(EPE);

    end

end