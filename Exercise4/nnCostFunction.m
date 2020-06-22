function [J,grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% X = horzcat(ones(m,1),X);
% a2 = sigmoid(X*Theta1');
% a2 = horzcat(ones(m,1),a2);
% h = sigmoid(a2*Theta2');
% cat = zeros(size(h));
% for i = 1:size(h,2)
%     cat(i,y(i)) = 1;
% end
% y1 = cat;
% Theta11 = Theta1;
% Theta11(:,1) = zeros(hidden_layer_size,1);
% Theta22 = Theta2;
% Theta22(:,1) = zeros(num_labels,1);
% J = (-1/m)*sum((y1 * (log(h))') + ((1-y1) * (log(1-h))')) + (lambda/(2*m)) * (sum(Theta11.^2) + sum(Theta22.^2));
% % e = y-h;
% % delta2 = (Theta2' * e) .* (h .* (1-h));
% % delta1 = (Theta1' * delta2) .* (a2 .* (1-a2));
% % D2 = Theta2_grad;
% %D2 = D2 + e * 
X = horzcat(ones(m,1),X);
z2 = X * Theta1';
h2 = sigmoid(z2);
a2 = horzcat(ones(m,1),h2);
z3 = a2 * Theta2';
a3 = sigmoid(z3);
yc = zeros(size(a3));
t1 = Theta1(:,2:end);
b1 = Theta1(:,1);
t2 = Theta2(: , 2:end);
b2 = Theta2(:,1);                                                               
J1 = 0;                                                                         
for i = 1:m                                                                       
    yc(i,y(i)) = 1;                                                             
end                                                                             
J = (lambda/(2*m)) * (sum(sum(t1.^2)) + sum(sum(t2.^2)));                         
for j = 1:m                                                                     
    s = (log(a3(j,:)) * (yc(j,:))') + (log(1-a3(j,:)) * (1 - yc(j,:))');          
    J1 = J1+s;
end
J = J + ((-1/m) * J1);

d3 = a3 - yc;
d2 = (d3 * t2) .* (h2 .* (1-h2));
delta1 = (d2' * X);
delta2 = (d3' * a2);
tf1 = Theta1;
tf1(:,1) = zeros(hidden_layer_size,1);
tf2 = Theta2;
tf2(:,1) = zeros(num_labels,1);

Theta1_grad = (1/m) * (delta1 + lambda * tf1);
Theta2_grad = (1/m) * (delta2 + lambda * tf2);


        















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
