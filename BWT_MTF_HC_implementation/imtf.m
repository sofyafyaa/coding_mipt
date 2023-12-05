function [imtf_result] = imtf(text_mtf, mtf_alphabet)
%IMTF Inverese Move-to-Front Transform implementation

imtf_result = char(zeros(1, length(text_mtf)));
for itter = 1 : length(text_mtf)
    symbol = mtf_alphabet(text_mtf(itter));
    imtf_result(1, itter) = symbol;
end

end

