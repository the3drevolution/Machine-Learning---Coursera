function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval)) // equivalent to (predict != y)
%

CSigmaVals = [0.01 0.03 0.1 0.3 1.0 3.0 10.0 30.0];
x1 = [1 2 1]; x2 = [0 4 -1];
C = 1;
sigma = 0.3;
predictionError = 999999999;	
bestC = bestSigma = 0;
for i=1:8,
	C = CSigmaVals(i);
	for j=1:8,
		sigma = CSigmaVals(j);
		model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
		predictions = svmPredict(model,Xval);
		currentPredictionError = mean(double(predictions ~= yval));
		if(currentPredictionError < predictionError),
		bestC = C;
		bestSigma = sigma;
		predictionError = currentPredictionError;
		end;
	end;
end;
		
C = bestC;
sigma = bestSigma;		
% =========================================================================

end
