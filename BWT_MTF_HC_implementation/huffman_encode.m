function [encoded, dictionary] = huffman_encode(input_string)
    % Count the frequency of each character in the input string
    freq = count_freq(input_string);

    % Build the Huffman tree
    tree = build_huffman_tree(freq);

    % Initialize an empty cell array for the dictionary
    dictionary = cell(1, 256);  % Consider all possible ASCII values

    % Generate the Huffman codes
    dictionary = generate_codes(tree, '', dictionary);

    % Encode the input string using the generated Huffman codes
    encoded = encode_string(input_string, dictionary);
end
