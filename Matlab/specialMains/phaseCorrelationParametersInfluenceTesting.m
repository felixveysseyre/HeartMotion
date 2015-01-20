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

%% Read images %%

imagesSequence = sequence();
imagesSequence.fillFromTestingSequence('../../Data/', 'TestingSequence3', Inf);

%% Correlation Phase - block size & resizing factor paremeter influence testing %%

blockSizes = {1, 3, 5, 7};
resizingFactors = {1, 3, 5, 7};

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

overlaying = 1;

displayPhaseCorrelationParametersInfluence(imagesSequence, velocitiesXSequences, velocitiesYSequences, blockSizes, resizingFactors, overlaying);