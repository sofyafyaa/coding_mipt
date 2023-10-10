function [alphabet, probabilities] = alphabet_probabilities(str)
%alphabet_probabilities
% This func finds alphabet used ind string str
% and counts probabilities 
str_len = strlength(str);
alphabet = sort(unique(str));
str_sorted = sort(str);
probabilities = cell(strlength(alphabet), 2);

iti = 1;
amount = 1;
probabilities(iti, :) = {str_sorted(1), amount/str_len};

for itc = 2 : str_len
    if str_sorted(itc) == str_sorted(itc - 1)
        amount = amount + 1;
        probability = amount/str_len;
        probabilities(iti, :) = {str_sorted(itc), probability};
    else
        iti = iti + 1;
        amount = 1;
        probability = amount/str_len;
        probabilities(iti, :) = {str_sorted(itc), probability};
    end

end

probabilities = cell2mat(probabilities(:, 2));
