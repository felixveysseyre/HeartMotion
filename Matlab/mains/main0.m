clc;
clear all;
close all;

%% Paths %%

addpath('../sequence');

addpath('../tools');
addpath('../displaying');

addpath('../hornAndSchunck');
addpath('../lucasAndKanade');
addpath('../blockMatching');

addpath('../testingSequenceGenerator');
addpath('../external');

%% Read images %%

imagesSequence = sequence();
imagesSequence.fillFromTestingSequence('../../Data/', 'Sequence2', 5);

%% Compute velocities %%

methodUsed = 1;

if methodUsed == 1

    %% Horn & Schunck %%

    alpha = 50;
    numberOfIterations = 50;
    [velocitiesXSequence, velocitiesYSequence] = hornAndSchunck(imagesSequence, alpha, numberOfIterations);

elseif methodUsed == 2

    %% Lucas & Kanade %%

    blockSize = 5;
    windowType = 'gaussian';
    [velocitiesXSequence, velocitiesYSequence] = lucasAndKenade(imagesSequence, blockSize, windowType);

elseif methodUsed == 3

    %% Block Matching %%

    blockSize = 21;
    [velocitiesXSequence, velocitiesYSequence] = blockMatching(imagesSequence, blockSize);

end

%% Display %%

format = 8/5;
quiverFactor = 0.2;
autoTresholding = 1;
overlaying = 1;

displaySequence(imagesSequence, format);
displayDifferences(imagesSequence, format)
displayMotionField(imagesSequence, velocitiesXSequence, velocitiesYSequence, format, quiverFactor, autoTresholding);
displayNorm(imagesSequence, velocitiesXSequence, velocitiesYSequence, format, overlaying);
displayComparison(imagesSequence, velocitiesXSequence, velocitiesYSequence, format);

displaySummary(imagesSequence, velocitiesXSequence, velocitiesYSequence, 0.5*quiverFactor, autoTresholding, overlaying);

