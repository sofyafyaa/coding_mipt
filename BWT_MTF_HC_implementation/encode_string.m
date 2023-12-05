function encoded = encode_string(input_string, dictionary)
    % Encode the input string using the Huffman codes
    encoded = '';
    for i = 1:length(input_string)
        char_code = uint8(input_string(i));
        if ~isempty(dictionary{char_code})
            encoded = [encoded, dictionary{char_code}];
        else
            error('Character not found in the dictionary');
        end
    end
end