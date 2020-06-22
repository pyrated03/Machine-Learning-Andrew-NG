function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%
X = horzcat(ones(size(X,1),1), X);
s1 = X * (Theta1');

s = sigmoid(s1);
s = horzcat(ones(size(s,1),1), s);
h1 = s * (Theta2');
h = sigmoid(h1);
l = size(h,1);
for i = 1:l
    c = h(i,:);
    max = -1;
    d = length(c);
    z=0;
    for j = 1:d
        if c(1,j)>max
            max = c(1,j);
            z = j;
        end
    end
    p(i) = z;
end








% =========================================================================


end
