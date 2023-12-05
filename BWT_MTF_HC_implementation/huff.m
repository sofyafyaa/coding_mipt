input_string = 'hello world';

[encoded, dictionary] = huffman_encode(input_string);
decoded = huffman_decode(encoded, dictionary);

disp('Original String:');
disp(input_string);

disp('Encoded String:');
disp(encoded);

disp('Decoded String:');
disp(decoded);