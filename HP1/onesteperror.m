clear
clc
numberOfTrials = 1000; 
numberBits = 120; %bits
p=[12,24,48,70,100,120]; %patterns
%diagElements=0; %if diagonal = 0
diagElements=1; %if diagonal is not = 0

for j=1:6
    errorOccured = 0;
    for n=1:numberOfTrials
    numberPatterns = p(j);
    patterns=GeneratePatterns(numberBits,numberPatterns);
    w=WeightMatrix(patterns,diagElements); 
    
    chosenPattern=datasample(patterns,1,2); %generad slumpmässig kolumn från genererad pattern
    randPattern=randi([1 120],1);
    %newPattern(randPattern)=newPattern(randPattern).*(-1);

    newState=sign(sum(w.*chosenPattern));
    newState=transpose(newState);
    
    %if newState == 0 %defines sign(0)=1
        %newState = 1
    %end
    
    if newState(randPattern) ~= chosenPattern(randPattern)
        errorOccured = errorOccured+1;

    end
    end
    errorProbability (j) = errorOccured/numberOfTrials
end




