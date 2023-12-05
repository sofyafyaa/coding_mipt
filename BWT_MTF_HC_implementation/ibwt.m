function [text_ibwt] = ibwt(bwt_result)
%IBWT Inverese Burrows-Wheeler Transform
input = bwt_result.';
reverse_mtx = input;
    for itter = 1 : length(bwt_result) - 1
        sorted = char(sort(string(reverse_mtx)));
        reverse_mtx = [input, sorted];
    end
text_ibwt = reverse_mtx(reverse_mtx(:, end)== ' ', :);
end

