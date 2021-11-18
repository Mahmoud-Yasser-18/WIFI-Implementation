clear; clc; close all;

%% Requerement 4-a
testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','BPSK',1/2,false,'ZF',inf,true)
%% Requirement 4-b
BER = [];
for SNR = 10:20
    BER = [BER,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','64QAM',3/4,false,'Weiner',10^(SNR/10),false)];
end
BER_ZF = [];
for SNR = 10:20
    BER_ZF = [BER_ZF,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','64QAM',3/4,false,'ZF',10^(SNR/10),false)];
end
semilogx(10:20,BER_ZF);
hold on;
semilogx(10:20,BER);
legend('ZF','Weiner');
title('64QAM-3/4 Coderate ZF VS Weiner,SNR VS BER');
xlabel('SNR(dB)');
ylabel('BER');
%% requirement 4-c
testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','64QAM',3/4,false,'ZF',10^(3),false)
figure;
testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','64QAM',3/4,false,'Weiner',10^(3),false)

%% requirement 4-d
BER_floating_16 = [];
for SNR = 10:20
    BER_floating_16 = [BER_floating_16,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','16QAM',3/4,false,'Weiner',10^(SNR/10),false)];
end
BER_fixed_16 = [];
for SNR = 10:20
    BER_fixed_16 = [BER_fixed_16,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','16QAM',3/4,true,'Weiner',10^(SNR/10),false)];
end
semilogy(10:20,BER_floating_16);
hold on;
semilogy(10:20,BER_fixed_16);
legend('floating-point','fixed-point');
title('16QAM-3/4 Coderate floating-point vs fixed-point,SNR VS BER');
xlabel('SNR(dB)');
ylabel('BER');

%% requirement 4-e
BER_floating_BPSK_34 = [];
for SNR = 10:20
    BER_floating_BPSK_34 = [BER_floating_BPSK_34,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','BPSK',3/4,false,'Weiner',10^(SNR/10),false)];
end
BER_floating_BPSK_12 = [];
for SNR = 10:20
    BER_floating_BPSK_12 = [BER_floating_BPSK_12,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','BPSK',1/2,false,'Weiner',10^(SNR/10),false)];
end
BER_floating_QPSK_34 = [];
for SNR = 10:20
    BER_floating_QPSK_34 = [BER_floating_QPSK_34,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','QPSK',3/4,false,'Weiner',10^(SNR/10),false)];
end
BER_floating_QPSK_12 = [];
for SNR = 10:20
    BER_floating_QPSK_12 = [BER_floating_QPSK_12,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','QPSK',1/2,false,'Weiner',10^(SNR/10),false)];
end
BER_floating_16QAM_34 = [];
for SNR = 10:20
    BER_floating_16QAM_34 = [BER_floating_16QAM_34,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','16QAM',3/4,false,'Weiner',10^(SNR/10),false)];
end
BER_floating_16QAM_12 = [];
for SNR = 10:20
    BER_floating_16QAM_12 = [BER_floating_16QAM_12,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','16QAM',1/2,false,'Weiner',10^(SNR/10),false)];
end
BER_floating_64QAM_34 = [];
for SNR = 10:20
    BER_floating_64QAM_34 = [BER_floating_64QAM_34,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','64QAM',3/4,false,'Weiner',10^(SNR/10),false)];
end
BER_floating_64QAM_23 = [];
for SNR = 10:20
    BER_floating_64QAM_23 = [BER_floating_64QAM_23,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','64QAM',2/3,false,'Weiner',10^(SNR/10),false)];
end
semilogy(10:20,BER_floating_BPSK_12);
hold on;
semilogy(10:20,BER_floating_BPSK_12);
semilogy(10:20,BER_floating_BPSK_34);
semilogy(10:20,BER_floating_QPSK_12);
semilogy(10:20,BER_floating_QPSK_34);
semilogy(10:20,BER_floating_16QAM_12);
semilogy(10:20,BER_floating_16QAM_34);
semilogy(10:20,BER_floating_64QAM_23);
semilogy(10:20,BER_floating_64QAM_34);
hold off;
legend('BPSK-1/2','BPSK-3/4','QPSK-1/2','QPSK-3/4','16QAM-1/2','16QAM-3/4','64QAM-2/3','64QAM-3/4');
title('BER VS SNR for all rates');
xlabel('SNR');
ylabel('BER');
% figure;
% plot(10:20,BER_floating_BPSK_12);
% hold on;
% plot(10:20,BER_floating_BPSK_12);
% plot(10:20,BER_floating_BPSK_34);
% plot(10:20,BER_floating_QPSK_12);
% plot(10:20,BER_floating_QPSK_34);
% plot(10:20,BER_floating_16QAM_12);
% plot(10:20,BER_floating_16QAM_34);
% plot(10:20,BER_floating_64QAM_23);
% plot(10:20,BER_floating_64QAM_34);
% hold off;
% legend('BPSK-1/2','BPSK-3/4','QPSK-1/2','QPSK-3/4','16QAM-1/2','16QAM-3/4','64QAM-2/3','64QAM-3/4');
% title('BER VS SNR for all rates');
% xlabel('SNR');
% ylabel('BER');

%% requirement 4-f
BER_fixed_BPSK_34 = [];
for SNR = 10:20
    BER_fixed_BPSK_34 = [BER_fixed_BPSK_34,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','BPSK',3/4,true,'Weiner',10^(SNR/10),false)];
end

BER_fixed_BPSK_12 = [];
for SNR = 10:20
    BER_fixed_BPSK_12 = [BER_fixed_BPSK_12,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','BPSK',1/2,true,'Weiner',10^(SNR/10),false)];
end
BER_fixed_QPSK_34 = [];
for SNR = 10:20
    BER_fixed_QPSK_34 = [BER_fixed_QPSK_34,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','QPSK',3/4,true,'Weiner',10^(SNR/10),false)];
end
BER_fixed_QPSK_12 = [];
for SNR = 10:20
    BER_fixed_QPSK_12 = [BER_fixed_QPSK_12,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','QPSK',1/2,true,'Weiner',10^(SNR/10),false)];
end
BER_fixed_16QAM_34 = [];
for SNR = 10:20
    BER_fixed_16QAM_34 = [BER_fixed_16QAM_34,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','16QAM',3/4,true,'Weiner',10^(SNR/10),false)];
end
BER_fixed_16QAM_12 = [];
for SNR = 10:20
    BER_fixed_16QAM_12 = [BER_fixed_16QAM_12,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','16QAM',1/2,true,'Weiner',10^(SNR/10),false)];
end
BER_fixed_64QAM_34 = [];
for SNR = 10:20
    BER_fixed_64QAM_34 = [BER_fixed_64QAM_34,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','64QAM',3/4,true,'Weiner',10^(SNR/10),false)];
end
BER_fixed_64QAM_23 = [];
for SNR = 10:20
    BER_fixed_64QAM_23 = [BER_fixed_64QAM_23,testFile('test_file_1.txt','retreived_file_1_BPSK0.5.txt','64QAM',2/3,true,'Weiner',10^(SNR/10),false)];
end
figure
hold on;
semilogy(10:20, BER_fixed_BPSK_12)
semilogy(10:20, BER_fixed_BPSK_34)
semilogy(10:20, BER_fixed_QPSK_12)
semilogy(10:20, BER_fixed_QPSK_34)
semilogy(10:20, BER_fixed_16QAM_12)
semilogy(10:20, BER_fixed_16QAM_34)
semilogy(10:20, BER_fixed_64QAM_23)
semilogy(10:20, BER_fixed_64QAM_34)
hold off;
legend('BPSK12','BPSK34','QPSK12','QPSK34','16QAM12','16QAM34','64QAM23','64QAM34')
title('SNR vs BER, All Rates, Fixed Point')
xlabel('SNR(dB)')
ylabel('BER')


%%
function error = testFile(infile,outfile,mod_type,code_rate,fixed,eq_type,SNR,return_file)
numberOfBits = 8;
maxDataSize = 8^5-8;
%%% read the files
binary = ReadFile(infile,numberOfBits);
h = [0.8208+0.2052j,0.4104+0.1026j,0.2052+0.2052j,0.1026+0.1026j];
[ref_cons,m] = create_ref_symbols(mod_type);
figure;
y = [];

%handle the case if the file is too small
if length(binary)-maxDataSize <= 0
    [x,Ps]= create_frame(binary, mod_type, code_rate);
    x = fi(x,1,8,6);
    nx = conv(x,h);
    nx = nx(1,1:length(x));
    nx = addNoise(nx,SNR,4);
    y = [y , decode_frame(x,eq_type,SNR,ref_cons,fixed)];
else
    % handle the case if the file is too large
    for i = 1:maxDataSize:length(binary)
        if i + maxDataSize-1 < length(binary)
            [x,Ps]= create_frame(binary(1,i:i+maxDataSize-1), mod_type, code_rate);
        else
            disp('final frame');
            [x,Ps]= create_frame(binary(1,i:end), mod_type, code_rate);
        end
        if fixed
            x = fi(x,1,32,24);
            x = double(x);
        end
        nx = conv(x,h);
        nx = nx(1,1:length(x));
        nx = addNoise(nx,SNR,m);
        if fixed
            nx = fi(nx,1,32,24);
        end
        y = [y , decode_frame(nx,eq_type,SNR,ref_cons,fixed)];
    end
end
error = sum((binary-y).^2)/length(binary)*100;
if return_file
    RetrieveFile(y,outfile);
end
end
