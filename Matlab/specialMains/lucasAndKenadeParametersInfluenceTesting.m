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

%% Lucas & Kanades - block size &  paremeter influence testing %%

blockSizes = {9, 15, 21, 27};
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

displayLucasAndKenadeParametersInfluence(imagesSequence, velocitiesXSequences, velocitiesYSequences, blockSizes, windowTypes, 1);
displayLucasAndKenadeParametersInfluence(imagesSequence, velocitiesXSequences, velocitiesYSequences, blockSizes, windowTypes, 0);