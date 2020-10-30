net.classify(xTrain)??

countOfTestingSet = 0;
countOfTrainingSet = 0;
countOfValidSet = 0;

for i=1:size(tTrain)
    if(tTrain(i)~=predTrain(i))
        countOfTrainingSet = countOfTrainingSet+1;
    end
end
classErrorTrain = (1/size(tTrain,1)) * countOfTrainingSet;

for j=1:size(tTest)
    if(tTest(j)~=predictedTest(j))
        countOfTestingSet = countOfTestingSet+1;
    end
end
classErrorTest = (1/size(tTest,1)) * countOfTestingSet;

for k=1:size(tValid)
    if(tValid(k)~=predValidation(k))
        countOfValidSet = countOfValidSet+1;
    end
end
classErrorValid = (1/size(tValid,1)) * countOfValidSet;