function classificationError = ClassError(predictionSet,targetSet)
countOfSet=0;

for i=1:size(targetSet,1)
    if(targetSet(i)~=predictionSet(i))
        countOfSet = countOfSet+1;
    end
end
classificationError = (1/size(targetSet,1)) * countOfSet;
end