function networkOne=NetWorkNoHiddenLayers(xTrainReshape,xValidReshape,tTrain, tValid)
%no hidden layer

numberOfInputs=size(xTrainReshape,1);
my=0;
sigma=1/sqrt(numberOfInputs);
learningRate=0.1;

numberPatternsOfTraining=size(xTrainReshape,2);
numberOfOutputsTraining = size(tTrain,1);

numberOfValidationPatterns=size(xValidReshape,2);
numberOfOutputsValid= size(tValid,1);

sizeOfMiniBatch = 100;
numberOfMiniBatch=numberPatternsOfTraining/sizeOfMiniBatch;
numberOfEpochs = 20;

localFieldTrain=zeros(numberOfOutputsTraining,numberPatternsOfTraining);
outputTrain=zeros(numberOfOutputsTraining,numberPatternsOfTraining);
outputError=zeros(numberOfOutputsTraining,numberPatternsOfTraining);
yTrain=zeros(numberOfOutputsTraining,numberPatternsOfTraining);


% %initializing weights
% weightMatrix = normrnd(my,sigma,[numberOfOutputsTraining,numberOfInputs]);
% threshold = zeros(numberOfOutputsTraining,1);
cellArray=cell(20,2);
classificationErrorTrain=[];
classificationErrorValidation=[];

%Train the network
for i=1:numberOfEpochs
    cellArray(i,:)={weightMatrix, threshold};
    
    shuffle = randperm(numberPatternsOfTraining,numberPatternsOfTraining);
    miniBatch = reshape(shuffle,[sizeOfMiniBatch,numberOfMiniBatch]);
    
    for t=1:numberOfMiniBatch
        for myTrain=miniBatch(:,t)
            
            for j=1:numberOfOutputsTraining
                localFieldTrain(j,myTrain)=sum((weightMatrix(j,:)'.*xTrainReshape(:,myTrain))-threshold(j));
                outputTrain(j,myTrain) = 1./(1+exp(-localFieldTrain(j)));
                outputError(j,myTrain) = (tTrain(j,myTrain) - outputTrain(j,myTrain)).*(-exp(-localFieldTrain(j,myTrain)))./(1+exp(-localFieldTrain(j,myTrain))).^2;
            end
            
            for n=1:numberOfOutputsTraining
                if outputTrain(n,myTrain) == max(outputTrain(:,myTrain))
                    yTrain(n,myTrain)=1;
                else
                    yTrain(n,myTrain)=0;
                end
            end
        end
        % Calculate delta weights
        deltaWeightMatrix = zeros(numberOfOutputsTraining,numberPatternsOfTraining);
        deltaThreshold = zeros(numberOfOutputsTraining,1);
        for k = 1:numberOfOutputsTraining
            for u=1:numberOfInputs
                deltaWeightMatrix(k,u) = learningRate*sum(outputError(k,:).*xTrainReshape(u,:));
            end
            deltaThreshold(k) = -learningRate.*sum(outputError(k,:));
        end
        
        % Update weights and thresholds
        for l = 1:numberOfOutputsTraining
            for s=1:numberOfInputs
                weightMatrix(l,s) = weightMatrix(l,s) + deltaWeightMatrix(l,s);
            end
            threshold(l) = threshold(l) + deltaThreshold(l);
        end
    end
    
    for p=1:numberPatternsOfTraining
        sumOfclassificationErrorTrain=sum(abs(tTrain(:,p)-yTrain(:,p)));
    end
    
    classificationErrorTrain(i)=1./(2*numberPatternsOfTraining)*sum(sumOfclassificationErrorTrain);
    
    for myValid=1:numberOfValidationPatterns
        for m=1:numberOfOutputsValid
            localFieldValid(m,myValid)=sum(weightMatrix(m,:).*xValidReshape(:,myValid)-threshold(m));
            outputValid(m,myValid)=1./(1+exp(-localFieldValid(m)));
        end
        
        for o=1:numberOfOutputsValid
            if outputValid(o,myTrain) == max(outputValid(:,myTrain))
                yValid(o,myTrain)=1;
            else
                yValid(o,myTrain)=0;
            end
        end
        
    end
    
    for r=1:numberOfValidationPatterns
        sumOfclassificationErrorValidation=sum(abs(tValid(:,r)-yValid(:,r)));
    end
    
    classificationErrorValidation(i)=1./(2*numberOfValidationPatterns)*sum(sumOfclassificationErrorValidation);
    
end
disp('Run is done!')
end


    
    