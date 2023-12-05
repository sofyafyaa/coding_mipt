function tree = build_huffman_tree(freq)
    % Build the Huffman tree using the given frequency array
    nodes = cell(length(freq), 1);

    for i = 1:length(freq)
        nodes{i} = struct('symbol', i, 'frequency', freq(i), 'left', [], 'right', []);
    end

    while length(nodes) > 1
        % Sort nodes based on frequency
        [~, sorted_indices] = sort(cellfun(@(x) x.frequency, nodes));
        nodes = nodes(sorted_indices);

        % Create a new node
        new_node = struct('symbol', 0, 'frequency', nodes{1}.frequency + nodes{2}.frequency, 'left', nodes{1}, 'right', nodes{2});

        % Remove the first two nodes and add the new node
        new_node = {new_node};
        nodes = [new_node; nodes(3:end)];
    end

    % The remaining node is the root of the Huffman tree
    tree = nodes{1};
end