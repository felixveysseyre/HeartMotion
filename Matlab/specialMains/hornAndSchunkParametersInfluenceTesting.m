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

imagesSequence = sequence();
imagesSequence.fillFromTestingSequence('../../Data/', 'Sequence2', 2);

displaySequence(imagesSequence, 8/5);

%% Horn & Schunck - alpha paremeter influence testing %%

numberOfIterations = 50;

alphas = {50, 250, 500, 2000};

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