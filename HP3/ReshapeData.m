% function centering=ReshapeData(xTrain,input)
% mean=CalculateMean(xTrain);
% 
% numberOfInputs=size(input,2);
% numberOfPatterns=size(input,1);
% 
% for j=1:numberOfInputs
%     for k=1:numberOfPatterns
%         centering(j,k)=input(j,k)-mean(k);
%     end
% end