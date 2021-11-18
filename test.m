%%
clear;
clc;
numberOfBits = 8;

%%% read the files
[data] = ReadFile('test_file_1.txt',numberOfBits);
%%% return the recieved file
RetrieveFile(data);
%% Base implementation without channel
clear
clc
%binary=randi([0 1],1,48*8*85);
numberOfBits = 8;
maxDataSize = 8^5-8;
%%% read the files
 binary = ReadFile('test_file_1.txt',numberOfBits);

mod_type="16QAM"; code_rate=3/4;
ref_cons = create_ref_symbols(mod_type);
figure;
y = [];

%handle the case if the file is too small
if length(binary)-maxDataSize <= 0
    [x,Ps]= create_frame(binary, mod_type, code_rate);
    y = [y , decode_frame(x,'ZF',10,ref_cons,false)];
else
    % handle the case if the file is too large
    for i = 1:maxDataSize:length(binary)
        if i + maxDataSize-1 < length(binary)
            [x,Ps]= create_frame(binary(1,i:i+maxDataSize-1), mod_type, code_rate);
        else
            disp('final frame');
            [x,Ps]= create_frame(binary(1,i:end), mod_type, code_rate);
        end
        y = [y , decode_frame(x,'ZF',10,ref_cons,false)];
    end
end
disp(sum((binary-y).^2))
RetrieveFile(y);
%% floating-point implementation
clear
clc
binary=randi([0 1],1,48*8*85);
numberOfBits = 8;
maxDataSize = 8^5;
%%% read the files
% binary = ReadFile('test_file_1.txt',numberOfBits);
%%
mod_type="16QAM"; code_rate=3/4; Equalization_type = 'Weiner';
ref_cons = create_ref_symbols(mod_type);
h = [0.8208+0.2052j,0.4104+0.1026j,0.2052+0.2052j,0.1026+0.1026j];
y = [];

%handle the case if the file is too small
if length(binary)-maxDataSize <= 0
    [x,Ps]= create_frame(binary, mod_type, code_rate);
    SNR = inf;
    nx = conv(x,h);
    nx = nx(1,1:length(x));
    var = sqrt(Ps/(2*SNR));
    noiser = var*randn(size(nx));
    noisei = var*randn(size(nx));
    noise = noiser + 1j*noisei;
    nx = nx + noise; 
    y = [y , decode_frame(nx,Equalization_type,SNR,ref_cons,false)];
else
    % handle the case if the file is too large
    for i = 1:maxDataSize:length(binary)
        if i + maxDataSize-1 < length(binary)
            [x,Ps]= create_frame(binary(1,i:i+maxDataSize-1), mod_type, code_rate);
        else
            [x,Ps]= create_frame(binary(1,i:end), mod_type, code_rate);
        end
        nx = conv(x,h);
        nx = nx(1,1:length(x));
        y = [y , decode_frame(nx,Equalization_type,SNR,ref_cons)];
    end
end
disp(sum((binary-y).^2))
% recChar= char(bin2dec(reshape(char(y+'0'), 8,[]).'));

%% Fixed-point implementation
clear
clc
binary=randi([0 1],1,48*8*85);
numberOfBits = 8;
maxDataSize = 8^5;
%%% read the files
% binary = ReadFile('test_file_1.txt',numberOfBits);

mod_type="QPSK"; code_rate=0.5; Equalization_type = 'ZF';
ref_cons = create_ref_symbols(mod_type);
h = [0.8208+0.2052j,0.4104+0.1026j,0.2052+0.2052j,0.1026+0.1026j];
y = [];

%handle the case if the file is too small
if length(binary)-maxDataSize <= 0
    [x,Ps]= create_frame(binary, mod_type, code_rate);
    x_fi = fi(x,1,8,6);
    nx = conv(x,h);
    nx = nx(1,1:length(x));
    y = [y , decode_frame(nx,Equalization_type,10,ref_cons,true)];
else
    % handle the case if the file is too large
    for i = 1:maxDataSize:length(binary)
        if i + maxDataSize-1 < length(binary)
            [x,Ps]= create_frame(binary(1,i:i+maxDataSize-1), mod_type, code_rate);
        else
            [x,Ps]= create_frame(binary(1,i:end), mod_type, code_rate);
        end
        x_fi = fi(x,1,8,6);
        nx = conv(x,h);
        nx = nx(1,1:length(x));
        y = [y , decode_frame(nx,Equalization_type,10,ref_cons,true)];
    end
end
disp(sum((binary-y).^2))
% recChar= char(bin2dec(reshape(char(y+'0'), 8,[]).'));
%%

%%%%%% code sequence 
%generate random binary data to be transmitted 
%define modulation type and convolutional code rate 
%create reference symbols based on the modulation type 
% now to create a frames (small_preamble -- large_preamble -- siganl -- data)
  % generate small preamble data 
  % generate latge preamble data 
  % generate the signal 
     % define the rate 
     % length 
     % parity 
     % tail
  % encode the signal part
  % map the signal part to complex symbols 
  % generate the OFDM symbol from the signal part 
  % encode the data
  % map the data to complex symbols 
  % generate OFDM symbols from the data part 
  % assemble the frame [preamble1,preamble1,preamble2,preamble2, signal_symbole, data_symboles]

%pass the data through the channel

% decode the data from the recieved data 

%%%% edited fft number 
%%%%% make sure of the input data size, if the file size is bigger than the
%%%%% 12 bits divide the file (not coded yet)
     

%%
mod_type = 'QPSK';
ref_cons = create_ref_symbols(mod_type);
figure;
scatter(real(ref_cons),imag(ref_cons));
 