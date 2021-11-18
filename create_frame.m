function [frame,power] = create_frame(data, mod_type, code_rate)

% short traning preamble part
p1=sqrt(13/6)*[0, 0, 1 + 1i, 0, 0, 0, -1 - 1i, 0, 0, 0, 1 + 1i, 0, 0, 0, -1 - 1i, 0, 0, 0, -1 - 1i, 0, 0, 0, 1 + 1i, 0, 0, 0, 0,0, 0, 0, -1 - 1i, 0, 0, 0, -1 - 1i, 0, 0, 0, 1 + 1i, 0, 0, 0, 1 + 1i, 0, 0, 0, 1 + 1i, 0, 0, 0, 1 + 1i, 0, 0];
preamble1=zeros(1,64);
preamble1(1:27)=p1(27:53);
preamble1(39:64)=p1(1:26);

preamble1=ifft(preamble1);
preamble1=[preamble1(end-16+1:end),preamble1];

% long traning preamble part
preamble2 = create_large_preamble();

preamble2=ifft(preamble2);
preamble2=[preamble2(end-16+1:end),preamble2];

% Signal 

% Rate
switch mod_type
    case 'BPSK'
        table = [1/2 1 1 0 1; 3/4 1 1 1 1];
        rate = table(table(:,1)==code_rate,2:end);
    case 'QPSK'
        table = [1/2 0 1 0 1; 3/4 0 1 1 1];
        rate = table(table(:,1)==code_rate,2:end);
    case '16QAM'
        table = [1/2 1 0 0 1; 3/4 1 0 1 1];
        rate = table(table(:,1)==code_rate,2:end);
    case '64QAM'
        table = [2/3 0 0 0 1; 3/4 0 0 1 1];
        rate = table(table(:,1)==code_rate,2:end);
end
if(rem(length(data),8) ~= 0)
    error('bits are not multiples of 8')
end
% disp(length(data)/8);
len = dec2bin(length(data)/8,12)-'0';
parity = mod(sum([rate,len]),2);
tail = [ 0 0 0 0 0 0 ];
signal = [rate, len, parity, tail]; % == 48/2 = FEC 48 
signal = [signal , zeros(1,48/2-length(signal))];


codedsignal = convo_encode(signal, 1/2);
signal_complex = map_to_complex_symbols(codedsignal,'BPSK');
signal_symbole =create_OFDM_symboles(signal_complex);


% Data
codeddata = convo_encode(data, code_rate);
data_complex = map_to_complex_symbols(codeddata,mod_type);
data_complex =[data_complex , zeros(1,48-mod(length(data_complex),48))];

data_symboles = create_OFDM_symboles(data_complex);
frame = [preamble1,preamble1,preamble2,preamble2, signal_symbole, data_symboles];
power = sum(abs(frame).^2)/length(frame);
end