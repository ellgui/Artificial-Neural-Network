function classificationError = ClassError(predictionSet,targetSet)
countOfSet=0;
%class error är fraktionen av alla observationer som är felaktigt
%klassificierade

for i=1:size(targetSet)
    if(targetSet(i)~=predictionSet(i))
        countOfSet = countOfSet+1;
    end
end
classificationError = (1/size(targetSet,1)) * countOfSet;
end