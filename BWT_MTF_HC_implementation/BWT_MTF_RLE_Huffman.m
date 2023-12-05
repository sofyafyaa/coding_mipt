clear all; clc; close all;

text1 = 'на_дворе_трава_на_траве_дрова ';
text2 = 'hello_world ';
text3 = 'BANANA ';
% example dna sequence 8616 chars
text_dna1 = convertStringsToChars(readlines("dna.txt"));
% chimpanzee dna sequence 24996 chars
text_dna2 = convertStringsToChars(join(readlines("chimpanzee.txt")));
text_dna2(text_dna2 == ' ') = '';
text_dna2(end) = ' ';

% BWT + MTF + Huffman Encoding
% В данной лабораторной работе
input = text_dna2;

[text_bwt, ind_bwt] = bwt(input);

[text_mtf, mtf_alphabet] = mtf(text_bwt);

text_mtf = num2str(text_mtf);

[encoded, dictionary] = huffman_encode(text_mtf);

profit = (length(input)*8) / length(encoded);
disp(['PROFIT OF ENCODING: ', num2str(profit)])

decoded = huffman_decode(encoded, dictionary);

if decoded == text_mtf
    disp('HUFFMAN DECODING: TRUE');
else
    disp('HUFFMAN DECODING: FALSE');
end

text_mtf_inv = str2num(decoded);

text_bwt_inv = imtf(text_mtf_inv, mtf_alphabet);

if text_bwt_inv == text_bwt
    disp('MOVE-TO-FORWARD DECODING: TRUE');
else
    disp('MOVE-TO-FORWARD DECODING: FALSE');
end

% text_inv = ibwt(text_bwt_inv);
[~,idx_sort]= sort(ind_bwt);
text_inv = text_bwt_inv(idx_sort);

if text_inv == input
    disp('BURROWS-WHEELER DECODING: TRUE');
else
    disp('BURROWS-WHEELER DECODING: FALSE');
end
