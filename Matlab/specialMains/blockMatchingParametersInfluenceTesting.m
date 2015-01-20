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

addpath('../testingSequenceGenerator');
addpath('../external');

%% Read images %%

imagesSequence = sequence();
imagesSequence.fillFromTestingSequence('../../Data/', 'TestingSequence3', Inf);

%% Block Matching - bloc size paremeter influence testing %%

blockSizes = {1, 3, 5, 7};

velocitiesXSequences = [];
velocitiesYSequences = [];

for i = 1:1:length(blockSizes)
    
    blockSize = blockSizes{i};
    
    [velocitiesXSequence, velocitiesYSequence] = blockMatching(imagesSequence, blockSize);
    
    velocitiesXSequences{i} = velocitiesXSequence;
    velocitiesYSequences{i} = velocitiesYSequence;
    
end

%% Display %%

overlaying = 1;

displayBlockMatchingParametersInfluence(imagesSequence, velocitiesXSequences, velocitiesYSequences, blockSizes, overlaying);