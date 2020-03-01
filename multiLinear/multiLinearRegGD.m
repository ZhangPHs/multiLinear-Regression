% Gradient Descent version.
clear;clc;
load('houseData.mat');
x0 = ones(length(houseData(:,1)),1);
X = [x0, houseData(:,1:end-1)];
Y = houseData(:,end);
n = length(X(1,:)) - 1;
m = length(Y);
theta = ones(n + 1,1);
alpha = 0.001;
% randomly get theta values.

% mean normalization
% in order to calculate value,we need to record the intermediate value.
%X = meanNormalization(X); % so, do not call function,but coding directly as following:
%%
S = max(X) - min(X);
u = mean(X);
%%  argX(:,1) = zeros(length(argX(:,1)),1)
for i=2:n+1
  X(:,i) = (X(:,i) - u(i))/S(i);
end
%%

% start iteration.c
i = 1;
%J = zeros(1,1000);
startTime = time();
while(true) 
  % update theta.
  sigma = X'*(X*theta - Y)/m;
  theta = theta - alpha * sigma;
  
  % calculate the hypothesis function H
  H = Hypothesis(X, theta); 
  
  % calculate the J
  J(i) = costFunction(H, Y, m);
  if(J(i)<0.01)
    break;
  end
  disp(J(i));
  i = i + 1;
end
endTime = time();
disp(endTime - startTime);
% plot([1:100000],J(1:100000));



