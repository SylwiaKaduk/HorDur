function HEMD=HorDur(a)
%UNTITLED2 Gives a mean horizontal eye movemeny duration for the column 6 of the EOG matrix,
%where 1 is movement. 
%   Code used comes from
%   https://uk.mathworks.com/matlabcentral/answers/305533-how-to-count-number-of-repeating-s-in-data-series
%   as a result it gives list of numbers from the vector in one column,
%   with listed numbers of repetitions in other column
[~,~,c] = unique(a);
t = diff([0;c])~= 0;
ix = cumsum(t);
out=[a(t),accumarray(ix(:),1)];
%As a results there will be a column containing 0s and 1s and another
%column with number of them in each repetition. Next step creates a
%movement
%duration list that is only list of number of 1s in each repetition. 
HEMDlist=out(out(:,1)==1,:);
%mean value of repetition. each repetition equals to 0.5 ms durarion
HEMD05ms=nanmean(HEMDlist(:,2));
%Mean conversion to seconds
HEMD=HEMD05ms/2000;
end