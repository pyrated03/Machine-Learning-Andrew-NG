function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
h = X*theta;
s = sigmoid(h);
l1 = log(s);
z = ones(size(y));
l2 = log(z-s);
J = (-1/m) * ((y' * l1) + ((z-y)' * l2)) + (lambda/(2*m)) * (sum(theta.^2) - theta(1,1)^2);
theta1 = theta;
theta1(1,1) = 0;
grad = (((1/m) * (s - y))' * X) + (lambda/m) * theta1';






% =============================================================

end
