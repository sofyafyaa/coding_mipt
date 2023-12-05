function [bwt, bwt_index] = bwt(text)
%Implementation of the Burrows-Wheeler Transform
    % text -- array of chars

rotations = "";
idx = 1 : length(text);
idx = repmat(idx, length(text), 1);
for itter = 0 : length(text) - 1
    rotations(itter+1) = circshift(text, -itter);
    idx(itter+1, :) = circshift(idx(itter+1, :), -itter);
end

[sorted_rot, sorted_idx] = sort(rotations);
sorted_rot = sorted_rot.';
idx = idx(sorted_idx, :);

bwt = '';
bwt_index = zeros(1, length(text));
for itter = 1 : length(text)
    str = convertStringsToChars(sorted_rot(itter));
    bwt(itter) = str(end);
    bwt_index(1, itter) = idx(itter, end);
end

