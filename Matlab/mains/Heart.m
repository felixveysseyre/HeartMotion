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
addpath('../correlationPhase');
addpath('../parametricModel');

addpath('../testingSequenceGenerator');
addpath('../external');

%% Read images %%

imagesSequence = sequence();
imagesSequence.fillFromTestingSequence('../../Data/', 'Sequence2', 4);

%% Compute velocities %%

methodUsed = 5;

if methodUsed == 1

    %% Horn & Schunck %%

    alpha = 500;
    numberOfIterations = 75;
    [velocitiesXSequence, velocitiesYSequence] = hornAndSchunck(imagesSequence, alpha, numberOfIterations);

elseif methodUsed == 2

    %% Lucas & Kanade %%

    blockSize = 17;
    windowType = 'gaussian';
    [velocitiesXSequence, velocitiesYSequence] = lucasAndKenade(imagesSequence, blockSize, windowType);

elseif methodUsed == 3

    %% Block Matching %%

    blockSize = 25;
    [velocitiesXSequence, velocitiesYSequence] = blockMatching(imagesSequence, blockSize);

elseif methodUsed == 4

    %% Correlation Phase %%

    blockSize = 17;
    resizingFactor = 5;
    filteringType = 'hamming';
    filteringKernelSize = 5;
    [velocitiesXSequence, velocitiesYSequence] = correlationPhase(imagesSequence, blockSize, resizingFactor, filteringType, filteringKernelSize);

elseif methodUsed == 5

    %% Parametric model (affine) %%

    blockSize = 27;
    windowType = 'gaussian';
    [velocitiesXSequence, velocitiesYSequence] = parametricModel(imagesSequence, blockSize, windowType);

end

%% Display %%

format = 16/10;
quiverFactor = 0.1;
autoTresholding = 1;
overlaying = 1;

% displaySequence(imagesSequence, format);
% displayDifferences(imagesSequence, format)
% displayMotionField(imagesSequence, velocitiesXSequence, velocitiesYSequence, format, quiverFactor, autoTresholding);
% displayNorm(imagesSequence, velocitiesXSequence, velocitiesYSequence, format, overlaying);
% displayComparison(imagesSequence, velocitiesXSequence, velocitiesYSequence, format);

displaySummary(imagesSequence, velocitiesXSequence, velocitiesYSequence, quiverFactor, autoTresholding, overlaying);