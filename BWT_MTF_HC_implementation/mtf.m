function [mtf_result, mtf_alphabet] = mtf(text_bwt)
%MTF Move-to-Front Transform implementation

[mtf_alphabet, ~] = alphabet_probabilities(text_bwt);

mtf_result = zeros(1, length(text_bwt));
for itter = 1 : length(text_bwt)
    mtf_result(1, itter) = find(mtf_alphabet == text_bwt(itter));
end

end

