function [H_cond_ans] = cond_entropy(X,Y)
%COND_ENTROPY

[X_alphabet, ~] = alphabet_probabilities(X);
[Y_alphabet, ~] = alphabet_probabilities(Y);

pairs = string(X_alphabet(:)) + string(Y_alphabet(:)).';
XY = string(X(:)) + string(Y(:));
XY = repmat(XY, 1, length(pairs(:)));

joint_prob = reshape(sum((XY == pairs(:).'), 1)/100, 4, 4);
val_prob = repmat(sum(joint_prob, 1), 4, 1);
cond_prob = joint_prob ./ val_prob;

H_cond = -joint_prob .* log2(cond_prob);
H_cond(isnan(H_cond)) = 0;

H_cond_ans = sum(H_cond, "all");

end


