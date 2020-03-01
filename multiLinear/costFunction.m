function J = costFunction(Hypothesis, Y, m)
  J = (Hypothesis - Y)'*(Hypothesis - Y)/(2*m);
endfunction
