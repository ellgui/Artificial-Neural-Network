clear all
clear all
clc

[xTrain, tTrain, xValid, tValid, xTest, tTest] = LoadCIFAR(1);

% Initialisation of parameters
%imshow(reshape(xTrain(:,25081),[32 32 3])); 
sizeOfMiniBatch = 100;
learningRate = 0.1;

% shuffle = randperm(size(xTrain,2));
% xTrain = xTrain(:,shuffle);

numberOfTrainingPatterns = size(xTrain,2);
numberOfInputsNoHiddenLayer = size(xTrain,1);

numberOfValidationPatterns = size(xValid,2);
numberOfTestingPatterns = size(xTest,2);

numberOfPixels=size(xTrain,1);
numberOfOutputs = size(tTrain,1);
epochs = 20;

numberOfIterations = numberOfTrainingPatterns*epochs;

%calculating the mean and centering data (reshaping)
xMean=CalculateMean(xTrain);

xTrainReshape = xTrain - xMean';
xValidReshape = xValid - xMean';
xTestReshape = xTest - xMean';

network1=NetWorkNoHiddenLayers(xTrainReshape,xValidReshape,tTrain, tValid)
