clear
clc
learningRate=0.02;
numberUpdates=10^5;
repetitions=10;

matrixOfPatterns=csvread('input_data_numeric.csv');

A = [1, 1, 1, 1, 1, 1, 1, -1, 1, -1, 1, -1, -1, -1, -1, -1];
B = [-1, -1, 1, 1, 1, -1, -1, -1, -1, 1, 1, -1, 1, 1, 1, -1];
C = [1, 1, 1, 1, 1, 1, -1, -1, 1, 1, 1, 1, 1, -1, 1, -1];
D = [-1, -1, -1, 1, -1, -1, 1, -1, 1, -1, 1, 1, -1, 1, -1, 1];
E = [1, 1, 1, -1, 1, 1, -1, 1, 1, 1, -1, 1, -1, -1, -1, 1];
F = [1, -1, 1, -1, -1, 1, -1, -1, -1, -1, -1, -1, 1, -1, -1, 1];
targetPattern= A'; %change inputpatterns here

output=zeros(16,1);
weightsNew=[];
thresholdNew=[];
weights=[];

for l=1:repetitions
    
for i=1:4   
weights(i)= -0.2 + (0.2+0.2).*rand(1,1);
end
threshold = -1 + (1-(-1)).*rand(1,1);

for j=1:numberUpdates
    my = randi([1,16]);

theSumInTheOutput=0;
for k=1:4
    summationOutput=weights(k).*matrixOfPatterns(my,k);
    theSumInTheOutput=theSumInTheOutput+summationOutput;
end

output(my)=tanh((1/2)*(-threshold+theSumInTheOutput));

for n=1:4
weightsNew(n)=weights(n)+learningRate.*(targetPattern(my)-output(my)).*(1-(tanh((1/2)*(-threshold+theSumInTheOutput))^2))*(1/2)*matrixOfPatterns(my,n);
end

thresholdNew=threshold-learningRate*(targetPattern(my)-output(my)).*(1-(tanh((1/2)*(-threshold+theSumInTheOutput))^2))*(1/2);

threshold=thresholdNew;
weights=weightsNew;
end
if sign(output)==targetPattern
    disp('linearly separable')
else
    disp('not linearly separable')
end
end


