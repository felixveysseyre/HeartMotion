clc;
clear all;
close all;

%% Paths %%

addpath('../sequence');

addpath('../tools');
addpath('../displaying');

addpath('../hornAndSchunck');
addpath('../lucasAndKanade');
addpath('../blockMatching');

addpath('../testingSequenceGenerator');
addpath('../external');

%% Parameters %%

imageSize = [128, 128];

formType = 'ellipse'; 
formParameters = [20, 30, 5, 255, 0]; 

transformationType = 'scaling';
transformationParameters = [0.9]; 

postProcessingParameters = [0, 0, 0, 255];

%% Computing %%

[imagesSequence, velocitiesXSequence, velocitiesYSequence] = createTestingSequence(imageSize, formType, formParameters, transformationType, transformationParameters, postProcessingParameters);

%% Displaying %%

format = 8/5;
quiverFactor = 1;
autoTresholding = 0;
overlaying = 1;

displaySequence(imagesSequence, format);
displayDifferences(imagesSequence, format)
displayMotionField(imagesSequence, velocitiesXSequence, velocitiesYSequence, format, quiverFactor, autoTresholding);
displayNorm(imagesSequence, velocitiesXSequence, velocitiesYSequence, format, overlaying);
displayComparison(imagesSequence, velocitiesXSequence, velocitiesYSequence, format);

displaySummary(imagesSequence, velocitiesXSequence, velocitiesYSequence, 0.5*quiverFactor, autoTresholding, overlaying);