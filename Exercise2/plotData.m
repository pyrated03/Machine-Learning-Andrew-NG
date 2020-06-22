function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
% Create New Figure
figure; hold on;
xp1 = [];
xp2 = [];
xn1 = [];
xn2 = [];
% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%8
l = length(y);
for i = 1:l
    if y(i,1) == 1,
        xp1 = [xp1, X(i,1)];
        xp2 = [xp2, X(i,2)];
    else
        xn1 = [xn1, X(i,1)];
        xn2 = [xn2, X(i,2)];
    end
end



plot(xp1,xp2,'+');
hold on;
plot(xn1,xn2,'o');
% =========================================================================



hold off;

end
