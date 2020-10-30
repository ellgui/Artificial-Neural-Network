% trainedNet1 = net.classify(xTrain);
predTrain = trainedNet.classify(trainedNet,xTrain); %[predTrain,err] = trainedNet.classify(trainedNet,xTrain);

classificationError1 = ClassError(predTrain,tTrain);

disp('Classification error for network 1:')
disp(classificationError1)

%% trainedNet2 = net.classify(xValid);
predValidation = trainedNet.classify(trainedNet,xValid);

classificationError2 = ClassError(predValidation,tValid);

disp('Classification error for network 2:')
disp(classificationError2)

%% trainedNet3 = net.classify(xTest);
predTest = trainedNet.classify(trainedNet,xTest);

classificationError3 = ClassError(predTest,tTest);

disp('Classification error for network 3:')
disp(classificationError3)