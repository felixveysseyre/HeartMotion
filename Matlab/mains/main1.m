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

%% Parameters %%

h = 250;
w = 250;

Ra = 50;
Rb = 75;

vIn = 255;
vOut = 0;

vMin = 0;
vMax = 255;

blurRatio = 1/25;

delta = 10;
noiseRatio = 0.05;

%% Computing %%

[imagesSequence, velocitiesXSequence, velocitiesYSequence] = createRingSequence(h, w, Ra, Rb, vIn, vOut, delta, blurRatio, noiseRatio, vMin, vMax);

%% Displaying %%

format = 4/3;
quiverFactor = 0.2;
autoTresholding = 1;

displaySequence(imagesSequence, format);
%displayDifferences(imagesSequence, format)
displayMotionField(imagesSequence, velocitiesXSequence, velocitiesYSequence, format, quiverFactor, autoTresholding);
%displayNorm(imagesSequence, velocitiesXSequence, velocitiesYSequence, format);
%displayComparison(imagesSequence, velocitiesXSequence, velocitiesYSequence, format);

%displaySummary(imagesSequence, velocitiesXSequence, velocitiesYSequence, 2*quiverFactor, autoTresholding);