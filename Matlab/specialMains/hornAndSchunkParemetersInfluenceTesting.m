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

%% Horn & Schunck - alpha paremeter influence testing %%

numberOfIterations = 50;

alphas = {0, 25, 50, 75};

velocitiesXSequences = [];
velocitiesYSequences = [];

for i = 1:1:length(alphas)
    
    alpha = alphas{i};
    
    [velocitiesXSequence, velocitiesYSequence] = hornAndSchunck(imagesSequence, alpha, numberOfIterations);
    
    velocitiesXSequences{i} = velocitiesXSequence;
    velocitiesYSequences{i} = velocitiesYSequence;
    
end

%% Display %%

overlaying = 1;

displayHornAndSchunkParemetersInfluence(imagesSequence, velocitiesXSequences, velocitiesYSequences, alphas, overlaying);