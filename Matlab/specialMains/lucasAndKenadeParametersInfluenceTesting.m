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

%% Lucas & Kanades - block size &  paremeter influence testing %%

blockSizes = {1, 3, 5, 7};
windowTypes = {'uniform', 'hamming', 'gaussian'};

velocitiesXSequences = [];
velocitiesYSequences = [];

for i = 1:1:length(blockSizes)
    
    blockSize = blockSizes{i};
    
    for j = 1:1:length(windowTypes)
        
        windowType = windowTypes{j};
        
        [velocitiesXSequence, velocitiesYSequence] = lucasAndKenade(imagesSequence, blockSize, windowType);
    
        velocitiesXSequences{i, j} = velocitiesXSequence;
        velocitiesYSequences{i, j} = velocitiesYSequence;
        
    end
    
end

%% Display %%

overlaying = 1;

displayLucasAndKenadeParametersInfluence(imagesSequence, velocitiesXSequences, velocitiesYSequences, blockSizes, windowTypes, overlaying);