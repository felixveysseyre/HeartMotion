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

%% Lucas & Kanades - block size &  paremeter influence testing %%

blockSizes = {3, 5, 7, 9};
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

displaySequence(imagesSequence, 16/10);