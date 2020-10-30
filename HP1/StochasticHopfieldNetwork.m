clear
clc
rng(123)
numberBits=200;
numberPatterns=7;
numberUpdates=2*10^5; %T
noiseParameter=2;
diagElements=0;
numberExperiment=100;

orderParameterSum=0;
for anExperiment=1:numberExperiment
    
patterns=GeneratePatterns(numberBits,numberPatterns);
patternOne=patterns(:,1);
updatedPatternOne=patternOne;
weightMatrix=WeightMatrix(patterns,diagElements);

orderParameter=0;
for anUpdate=1:numberUpdates
    
   bit=randi([1 numberBits],1);
   meanField=sum(weightMatrix(:,bit).*updatedPatternOne);
    
    
   g=1/(1+exp(-2*noiseParameter*meanField));
   probabilityOfg=rand;
   
   if probabilityOfg < g  
       updatedPatternOne(bit)=1;

   else
       updatedPatternOne(bit)=-1;
   end
   
   my=0;
   for aBit=1:numberBits
       my = my + patternOne(aBit)*updatedPatternOne(aBit);
   
   end
   
   orderParameter = orderParameter + my/numberBits;
end

orderParameterSum = orderParameterSum + orderParameter/numberUpdates;

end

orderParameterAverage=orderParameterSum/numberExperiment
    
    