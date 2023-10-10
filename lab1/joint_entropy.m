function [H_joint_ans] = joint_entropy(X,Y)
%JOINT_ENTROPY

[X_alphabet, ~] = alphabet_probabilities(X);
[Y_alphabet, ~] = alphabet_probabilities(Y);

pairs = string(X_alphabet(:)) + string(Y_alphabet(:)).';
XY = string(X(:)) + string(Y(:));
XY = repmat(XY, 1, length(pairs(:)));

joint_prob = reshape(sum((XY == pairs(:).'), 1)/100, 4, 4);

H_joint = -joint_prob .* log2(joint_prob);
H_joint(isnan(H_joint)) = 0;

H_joint_ans = sum(H_joint, "all");

end

