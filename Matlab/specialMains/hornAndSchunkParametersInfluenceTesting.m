clc;
clear all;
close all;

%% Paths %%

addpath('../sequence');

addpath('../tools');
addpath('../displaying');
addpath('../specialDisplaying');

addpath('../hornAndSchunck');

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

%% Horn & Schunck - alpha paremeter influence testing %%

numberOfIterations = 50;

alphas = {10, 50, 100, 350};

velocitiesXSequences = [];
velocitiesYSequences = [];

for i = 1:1:length(alphas)
    
    alpha = alphas{i};
    
    [velocitiesXSequence, velocitiesYSequence] = hornAndSchunck(imagesSequence, alpha, numberOfIterations);
    
    velocitiesXSequences{i} = velocitiesXSequence;
    velocitiesYSequences{i} = velocitiesYSequence;
    
end

%% Display %%

displayHornAndSchunkParametersInfluence(imagesSequence, velocitiesXSequences, velocitiesYSequences, alphas, 1);
displayHornAndSchunkParametersInfluence(imagesSequence, velocitiesXSequences, velocitiesYSequences, alphas, 0);

displaySequence(imagesSequence, 16/10);
