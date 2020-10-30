clear all
close all

[xTrain, tTrain, xValid, tValid, xTest, tTest] = LoadCIFAR(3);

layers = [imageInputLayer([32 32 3])  
fullyConnectedLayer(50)
reluLayer
fullyConnectedLayer(50)
reluLayer
fullyConnectedLayer(50)
reluLayer
fullyConnectedLayer(10)
softmaxLayer
classificationLayer];

options = trainingOptions( 'sgdm', ...  
'Momentum', 0.9, ...  
'MaxEpochs',400, ...
'MiniBatchSize', 8192, ...
'InitialLearnRate', 0.003, ...
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