clear all
close all

[xTrain, tTrain, xValid, tValid, xTest, tTest] = LoadCIFAR(4);

layers = [imageInputLayer([32 32 3])  
convolution2dLayer(3,20,'Padding',1,'Stride',1)
batchNormalizationLayer
reluLayer
maxPooling2dLayer(2,'Padding',0,'Stride',2)
convolution2dLayer(3,30,'Padding',1,'Stride',1)
batchNormalizationLayer
reluLayer
maxPooling2dLayer(2,'Padding',0,'Stride',2)
convolution2dLayer(3,50,'Padding',1,'Stride',1)
batchNormalizationLayer
reluLayer
fullyConnectedLayer(10)
softmaxLayer
classificationLayer];

options = trainingOptions( 'sgdm', ...  
'Momentum', 0.9, ...  
'MaxEpochs',120, ...
'MiniBatchSize', 8192, ...
'InitialLearnRate', 0.001, ...
'ValidationData', {xValid,tValid}, ... 
'Shuffle', 'every-epoch',...
'Plots','training-progress',...
'ValidationPatience', 3,... 
'ValidationFrequency', 30); 


trainedNetwork = trainNetwork(xTrain,tTrain, layers,options);

%Classification Error

% xtrain
predTrain = classify(trainedNetwork,xTrain); 
classificationError1 = ClassError(predTrain,tTrain);

%xvalid
predValidation = classify(trainedNetwork,xValid);
classificationError2 = ClassError(predValidation,tValid);

%xtest
predTest = classify(trainedNetwork,xTest);
classificationError3 = ClassError(predTest,tTest);

disp('Classification training error for network 2:')
disp(classificationError1)
disp('Classification validation error for network 2:')
disp(classificationError2)
disp('Classification validation error for network 2:')
disp(classificationError3)