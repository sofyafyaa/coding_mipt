function decoded = huffman_decode(encoded, dictionary)
    % Decode the Huffman encoded string using the dictionary
    decoded = '';
    current_code = '';

    for i = 1:length(encoded)
        current_code = [current_code encoded(i)];

        % Check if the current code is in the dictionary
        match = find(strcmp(dictionary, current_code), 1);

        % If a match is found, append the corresponding character to the decoded string
        if ~isempty(match)
            decoded = [decoded char(match)];
            current_code = '';
        end
    end
end