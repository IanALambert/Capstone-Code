function P = PolarizationEval(SR, eval)

if eval == 2
   P = abs(SR(2)-SR(3)-SR(4))/abs(SR(2)+SR(3)+SR(4)); 
elseif eval == 3
   P = abs(SR(3)-SR(2)-SR(4))/abs(SR(2)+SR(3)+SR(4)); 
elseif eval == 4
   P = abs(SR(4)-SR(3)-SR(2))/abs(SR(2)+SR(3)+SR(4)); 
end 
end