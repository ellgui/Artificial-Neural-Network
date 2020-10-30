predTrain = classify(trainedNet,xTrain); 

classificationError1 = ClassError(predTrain,tTrain);

disp('Classification error for network 1:')
disp(classificationError1)

%% 
predValidation = classify(trainedNet,xValid);

classificationError2 = ClassError(predValidation,tValid);

disp('Classification error for network 2:')
disp(classificationError2)

%% 
predTest = classify(trainedNet,xTest);

classificationError3 = ClassError(predTest,tTest);

disp('Classification error for network 3:')
disp(classificationError3)