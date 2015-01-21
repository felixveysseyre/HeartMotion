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
imagesSequence.fillFromTestingSequence('../../Data/', 'Sequence2', 2);

displaySequence(imagesSequence, 8/5);

%% Block Matching - bloc size paremeter influence testing %%

blockSizes = {17, 21, 25, 29};

velocitiesXSequences = [];
velocitiesYSequences = [];

for i = 1:1:length(blockSizes)
    
    blockSize = blockSizes{i};
    
    [velocitiesXSequence, velocitiesYSequence] = blockMatching(imagesSequence, blockSize);
    
    velocitiesXSequences{i} = velocitiesXSequence;
    velocitiesYSequences{i} = velocitiesYSequence;
    
end

%% Display %%

displayBlockMatchingParametersInfluence(imagesSequence, velocitiesXSequences, velocitiesYSequences, blockSizes, 1);
displayBlockMatchingParametersInfluence(imagesSequence, velocitiesXSequences, velocitiesYSequences, blockSizes, 0);