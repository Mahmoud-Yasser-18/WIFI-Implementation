function [mod_type,code_rate] = decode_rate(x)
if x  == [1 1 0 1]
    mod_type = 'BPSK';
    code_rate = 1/2;
elseif x == [ 1 1 1 1 ]
    mod_type = 'BPSK';
    code_rate = 3/4;
elseif x == [0 1 0 1]
    mod_type = 'QPSK';
    code_rate = 1/2;
elseif x == [0 1 1 1]
    mod_type = 'QPSK';
    code_rate = 3/4;
elseif x == [1 0 0 1]
    mod_type = '16QAM';
    code_rate = 1/2;
elseif x == [1 0 1 1]
    mod_type = '16QAM';
    code_rate = 3/4;
elseif x == [0 0 0 1]
    mod_type = '64QAM';
    code_rate = 2/3;
elseif x == [0 0 1 1]
    mod_type = '64QAM';
    code_rate = 3/4;
end