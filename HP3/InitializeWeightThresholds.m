function initializeWeightThresholds=InitializeWeightThresholds(numberOfOutputsTraining,numberOfInputs)




weightMatrix = normrnd(1,1/sqrt(numberOfInputs),[numberOfOutputsTraining,numberOfInputs]);
threshold = zeros(numberOfOutputsTraining,1);

