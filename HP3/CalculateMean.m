function calculateMean=CalculateMean(xTrain)

numberOfPatterns = size(xTrain,2);
numberOfInputs = size(xTrain,1);
calculateMean=[];

for i=1:numberOfInputs
    calculateMean(i)=sum(xTrain(i,:))/numberOfPatterns;
end
end

