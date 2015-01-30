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
addpath('../parametricModel');
addpath('../correlationPhase');

addpath('../testingSequenceGenerator');
addpath('../external');

%% Create testing sequence %%

% Parameters %

imageSize = [128, 128];

formType = 'ellipse';
formParameters = [20, 30, 10, 5/5*255, 0/5*255];

transformationType = 'scaling';
transformationParameters = [0.90];

postProcessingParameters = [0, 0.1, 0, 255];

% Compute %

[imagesSequence, theoricalVelocitiesXSequence, theoricalVelocitiesYSequence] = createTestingSequence(imageSize, formType, formParameters, transformationType, transformationParameters, postProcessingParameters);

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

    blockSize = 3;
    [velocitiesXSequence, velocitiesYSequence] = blockMatching(imagesSequence, blockSize);

elseif methodUsed == 4

    %% Correlation Phase %%

    blockSize = 9;
    resizingFactor = 3;
    filteringType = 'hamming';
    filteringKernelSize = 5;
    [velocitiesXSequence, velocitiesYSequence] = correlationPhase(imagesSequence, blockSize, resizingFactor, filteringType, filteringKernelSize);

elseif methodUsed == 5

    %% Parametric model (affine) %%

    blockSize = 3;
    windowType = 'gaussian';
    [velocitiesXSequence, velocitiesYSequence] = parametricModel(imagesSequence, blockSize, windowType);

end

%% Compute Norm, Phase and EPE sequences %%

[theoricalNormSequence, experimentalNormSequence, errorNormSequence, theoricalPhaseSequence, experimentalPhaseSequence, errorPhaseSequence] = computeNormAndPhaseErrors(theoricalVelocitiesXSequence, theoricalVelocitiesYSequence, velocitiesXSequence, velocitiesYSequence);

EPEsSequence = computeEPEs(theoricalVelocitiesXSequence, theoricalVelocitiesYSequence, velocitiesXSequence, velocitiesYSequence);

%% Displaying %%

format = 16/10;
quiverFactor = 0.5;
autoTresholding = 1;
overlaying = 1;

% displaySequence(imagesSequence, format);
% displayDifferences(imagesSequence, format)
% displayMotionField(imagesSequence, velocitiesXSequence, velocitiesYSequence, format, quiverFactor, autoTresholding);
% displayNorm(imagesSequence, velocitiesXSequence, velocitiesYSequence, format, overlaying);
% displayComparison(imagesSequence, velocitiesXSequence, velocitiesYSequence, format);

displaySummary(imagesSequence, velocitiesXSequence, velocitiesYSequence, 0.5*quiverFactor, autoTresholding, overlaying);

displayNormAndPhaseErrors(theoricalNormSequence, experimentalNormSequence, errorNormSequence, theoricalPhaseSequence, experimentalPhaseSequence, errorPhaseSequence);
%displayEPEs(EPEsSequence, format);
displayEPEsWFD(EPEsSequence, format, [0, 10]);