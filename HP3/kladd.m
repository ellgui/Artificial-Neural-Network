
% 
% % network 1 (no hidden layer)
% numberOfInputs=size(xTrainReshape,1);
% numberPatternsOfTraining=size(xTrainReshape,2);
% numberOfValidationPatterns=size(xValidReshape,2);
% 
% my=0;
% sigma=1/sqrt(numberOfInputs);
% learningRate = 0.1;
% sizeMiniBatch=100;
% 
% epochs = 20;
% numberOfIterations = numberPatternsOfTraining*epochs;
% 
% numberOfOutputs = size(tTrain,1);
% 
% localFieldTrain=zeros(numberOfOutputs,numberPatternsOfTraining);
% outputTrain=zeros(numberOfOutputs,numberPatternsOfTraining);
% outputError=zeros(numberOfOutputs,numberPatternsOfTraining);
% yTrain=zeros(numberOfOutputs,numberPatternsOfTraining);
% 
% localFieldValid = zeros(numberOfOutputs,numberOfValidationPatterns);
% outputValid = zeros(numberOfOutputs,numberOfValidationPatterns);
% yValid=zeros(numberOfOutputs,numberOfValidationPatterns);
% 
% localFieldMiniBatch = zeros(numberOfOutputs,sizeMiniBatch);
% outputMiniBatch = zeros(numberOfOutputs,sizeMiniBatch);
% yMiniBatch = zeros(numberOfOutputs,sizeMiniBatch);
% 
% classificationErrorTrain=[];
% classificationErrorValidation=[];
% 
% 
% % %initializing weights
% weightMatrix = normrnd(my,sigma,[numberOfOutputs,numberOfInputs]);
% threshold = zeros(numberOfOutputs,1);
% 
% 
% %training the network
% for i=1:numberOfIterations
%     
%     for j = 1:numberPatternsOfTraining
%         localFieldTrain(:,j) = weightMatrix*xTrainReshape(:,j)-threshold;
%         outputTrain(:,j) = 1./(1+exp(-localFieldTrain(:,j)));
%         %yTrain(:,j) = outputTrain(:,j) == max(outputTrain(:,j));
%     end
%     for k=1:numberPatternsOfTraining
%         if outputTrain(:,k) == max(outputTrain(:,k))
%             yTrain(:,j)=1;
%         else
%             yTrain(:,j)=0;
%         end
%     end
%     
%     classificationErrorTrain(end+1) = 1/(2*numberPatternsOfTraining)*sum(sum(abs(tTrain-yTrain)));
%     
%     %C for validation set
%     for l = 1:numberOfValidationPatterns
%         localFieldTrain(:,l) = weightMatrix*xTrainReshape(:,l)-threshold;
%         outputTrain(:,l) = 1./(1+exp(-localFieldTrain(:,l)));
%     end
%     
%     for m=1:numberOfValidationPatterns
%         if outputTrain(:,m) == max(outputTrain(:,m))
%             yValid(:,l)=1;
%         else
%             yValid(:,l)=0;
%         end
%     end
%     
%     classificationErrorValidation(end+1) = 1/(2*numberOfValidationPatterns)*sum(sum(abs(tValid-yValid)));
%     
%     %shuffle training set
%     shuffle = randperm(numberPatternsOfTraining);
%     xTrainReshape = xTrainReshape(:,shuffle);
%     tTrain=tTrain(:,shuffle);
%     
%     %determine minibatches that is used for calculation
%     miniBatch = randsample(numberPatternsOfTraining,sizeMiniBatch);
%     xTrainOfMiniBatch=xTrainReshape(:,miniBatch);
%     
%     %local fields
%     for n = 1:sizeMiniBatch
%         localFieldMiniBatch(:,n) = weightMatrix.*miniBatch(:,n)-threshold;
%         outputMiniBatch(:,n) = 1./(1+exp(-localFieldMiniBatch(:,n)));
%     end
%     
%     % Calculate delta
%     for o = 1:sizeOfMiniBatch
%         targetData = tTrain(:,xTrainOfMiniBatch(o));
%         deltaError(:,o) = (targetData - outputMiniBatch(:,o)).*(-exp(-localFieldMiniBatch(:,o))./(1+exp(-localFieldMiniBatch(:,o)).^2));
%     end
%     
%     % deltaw
%     deltaWeightMatrix = zeros(numberOfOutputs,numberOfInputs);
%     deltaThreshold = zeros(numberOfOutputs,1);
%     for p = 1:sizeOfMiniBatch
%         deltaWeightMatrix = deltaWeightMatrix + learningRate.*deltaError(:,p)*miniBatch(:,p)';
%         deltaThreshold = deltaThreshold - learningRate.*deltaError(:,p);
%     end
%     
%     % Update weights and thresholds
%     weightMatrix = weightMatrix + deltaWeightMatrix;
%     threshold = threshold + deltaThreshold;
% end
% 
% disp('Run is done!')
% end
% 
% 