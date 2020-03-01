% Normal Equation version.
clear;clc;
load('houseData.mat');
x0 = ones(length(houseData(:,1)),1);
X = [x0, houseData(:,1:end-1)];
Y = houseData(:,end);
n = length(X(1,:)) - 1;
m = length(Y);
theta = ones(n + 1,1);

% start iteration.c
startTime = time();
theta = pinv(X' * X) * X' * Y;
% calculate the hypothesis function H
H = Hypothesis(X, theta); 
% calculate the J
J = costFunction(H, Y, m);
endTime = time();
disp(endTime - startTime);