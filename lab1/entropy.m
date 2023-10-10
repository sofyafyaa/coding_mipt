function [H] = entropy(X)
%ENTROPY counts entropy of X alphabet
%   H(str) = E[-log2(p(str))]
    [~, H_probability] = alphabet_probabilities(X);
    H = -sum(H_probability .* log2(H_probability)); 
end
