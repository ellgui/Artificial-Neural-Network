function [xTrain, tTrain, xValid, tValid, xTest, tTest] = LoadCIFAR(exerciseNumber)


% This MATLAB function is an adaptation of the function helperCIFAR10Data.m,
% copyrighted by The MathWorks, Inc. It's intended use is for the
% course Artificial Neural Networks (FFR135/FIM720) at Chalmers University
% of Technology/University of Gothenburg, Gothenburg, Sweden, 2019.
%
%%%%%%%%%
% Input %
%%%%%%%%%
%
% exerciseNumber: A number that determines the format of the returned data.
% This number may be 1, 2, 3 or 4. See separate course material for a
% documentation.
%
%%%%%%%%%%
% Output %
%%%%%%%%%%
% 
% xTrain: The input patterns of the training set
% tTrain: The output patterns of the training set
% xValid: The input patterns of the validation set
% tValid: The output patterns of the validation set
% xTest: The input patterns of the test set
% tTest: The output patterns of the test set
% 
% The format of the output data depends on the in-argument provided as
% "exerciseNumber". See separate course material for a documentation.

if ismember(exerciseNumber,[1 2])
    array2DFormat = true;
elseif ismember(exerciseNumber,[3 4])
    array2DFormat = false;
else
    assert(false,'"Exercise number" must equal 1, 2, 3 or 4.');
end

% download and save the file in the temp directory 
cifar10Data = tempdir; 
url = 'https://www.cs.toronto.edu/~kriz/cifar-10-matlab.tar.gz';  
helperCIFAR10Data.download(url,cifar10Data);
[trainingImages,trainingLabels,testImages,testLabels] = helperCIFAR10Data.load(cifar10Data);
size(trainingImages)
xTrain = trainingImages(:, :, :, 1:40000);
tTrain = trainingLabels(1:40000);

xValid = double(trainingImages(:, :, :, 40001:50000));
tValid = trainingLabels(40001:50000);


xTest = testImages;
tTest = testLabels;

if ~array2DFormat
    return;
end

tTrain = grp2idx(tTrain);

tValid = grp2idx(tValid);
% Change format of output sets
xTrain = double(xTrain);
tTrain = double(tTrain);
tmp = zeros(10,40000);
for i = 1:40000
    tmp(tTrain(i),i) = 1;
end
tTrain = tmp;
xTrain = reshape(xTrain,[3072 40000]);
xTrain = xTrain/255;

xValid = double(xValid);
tValid = double(tValid);
tmp = zeros(10,10000);
for i = 1:10000
    tmp(tValid(i),i) = 1;
end
tValid = tmp;
xValid = reshape(xValid,[3072 10000]);
xValid = xValid/255;

xTest = double(xTest);
tTest = double(tTest);
tmp = zeros(10,10000);
for i = 1:10000
    tmp(tTest(i),i) = 1;
end
tTest = tmp;
xTest = reshape(xTest,[3072 10000]);
xTest = xTest/255;


end % end of function



