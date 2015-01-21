clc;
clear all;
close all;

%% Paths %%

addpath('../sequence');

addpath('../tools');
addpath('../displaying');
addpath('../specialDisplaying');

addpath('../hornAndSchunck');
addpath('../lucasAndKanade');
addpath('../blockMatching');
addpath('../correlationPhase/');

addpath('../testingSequenceGenerator');
addpath('../external');

%% Create testing sequence %%

% Parameters %

imageSize = [128, 128];

formType = 'ellipse';
formParameters = [20, 30, 10, 5/5*255, 0/5*255];

transformationType = 'scaling';
transformationParameters = [0.90];

postProcessingParameters = [0, 0, 0, 255];

% Compute %

[imagesSequence, theoricalVelocitiesXSequence, theoricalVelocitiesYSequence] = createTestingSequence(imageSize, formType, formParameters, transformationType, transformationParameters, postProcessingParameters);

%% Correlation Phase - block size & resizing factor paremeter influence testing %%

blockSizes = {3, 5, 7, 9};
resizingFactors = {1, 3, 5};

velocitiesXSequences = [];
velocitiesYSequences = [];

for i = 1:1:length(blockSizes)
    
    blockSize = blockSizes{i};
    
    for j = 1:1:length(resizingFactors)
        
        resizingFactor = resizingFactors{j};
        
        filteringType = 'hamming';
        filteringKernelSize = 5;
        
        [velocitiesXSequence, velocitiesYSequence] = correlationPhase(imagesSequence, blockSize, resizingFactor, filteringType, filteringKernelSize);
    
        velocitiesXSequences{i, j} = velocitiesXSequence;
        velocitiesYSequences{i, j} = velocitiesYSequence;
        
    end
    
end

%% Display %%

displayPhaseCorrelationParametersInfluence(imagesSequence, velocitiesXSequences, velocitiesYSequences, blockSizes, resizingFactors, 1);
displayPhaseCorrelationParametersInfluence(imagesSequence, velocitiesXSequences, velocitiesYSequences, blockSizes, resizingFactors, 0);

displaySequence(imagesSequence, 16/10);