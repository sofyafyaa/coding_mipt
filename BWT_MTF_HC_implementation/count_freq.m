function freq = count_freq(input_string)
    % Count the frequency of each character in the input string
    unique_chars = unique(input_string);
    freq = zeros(1, 256);  % Consider all possible ASCII values

    for i = 1:length(unique_chars)
        char_code = uint8(unique_chars(i));
        freq(char_code) = sum(input_string == unique_chars(i));
    end
end