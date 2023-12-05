function dictionary = generate_codes(node, code, dictionary)
    % Generate Huffman codes recursively
    if isempty(node.left) && isempty(node.right)
        dictionary{node.symbol} = code;
    else
        if ~isempty(node.left)
            dictionary = generate_codes(node.left, [code '0'], dictionary);
        end
        if ~isempty(node.right)
            dictionary = generate_codes(node.right, [code '1'], dictionary);
        end
    end
end