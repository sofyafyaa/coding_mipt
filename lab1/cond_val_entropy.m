function [H_val_cond] = cond_val_entropy(X, Y, val)
%cond_val_entropy calculates conditional entropy
%   H_cond = E[-log2(p(X|Y==y))]

[X_alphabet, ~] = alphabet_probabilities(X);

% Count condition probabilities
p_joint = sum(X(Y==val)==X_alphabet(:), 2) / length(X);
p_val = sum(Y==val, 2) / length(Y);
p_cond = p_joint / p_val;
p_cond(p_cond==0) = [];
H_val_cond = -sum(p_cond .* log2(p_cond));

end

