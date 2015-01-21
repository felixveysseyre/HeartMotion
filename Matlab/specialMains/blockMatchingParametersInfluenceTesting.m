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

%% Block Matching - bloc size paremeter influence testing %%

blockSizes = {1, 3, 7, 15};

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


displaySequence(imagesSequence, 16/10);