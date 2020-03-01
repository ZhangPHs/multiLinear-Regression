function X = meanNormalization(argX)
  S = max(argX) - min(argX);
  u = mean(argX);
%  argX(:,1) = zeros(length(argX(:,1)),1)
  for i=2:length(argX(1,:))+1
    argX(:,i) = (argX(:,i) - u(i))/S(i);
  end
  X = argX;
endfunction
