function data = decode_OFDM_symboles(OFDM_symboles,mod_type,code_rate,H,equ_type,SNR,ref_cons,fixed)

cyclic=16;
OFDM_symboles=reshape(OFDM_symboles.',80,[]).';
recieved_removed_cyclic = OFDM_symboles(:,cyclic+1:end);
recieved_fft=fft(recieved_removed_cyclic.').';
if fixed == true
    recieved_fft = fi(recieved_fft,1,32,24);
end
%Equalization
H_demaped = demap_sig(H);
complex_symboles= demap_sig(recieved_fft);
complex_symboles = frequencyEqualizer(complex_symboles, H_demaped, equ_type, SNR);

origSmb = complex_symboles(1:end-1,:);
complex_symboles=reshape(transpose(complex_symboles),1,[]);
origSmb = reshape(transpose(origSmb),1,[]);
scatter(real(origSmb),imag(origSmb));
title('Constellation after ZF 16QAM- r=3/4');
hold on;
[dummy,codedin ]=MaxLike_Reciver(complex_symboles,mod_type,ref_cons);

trellis = poly2trellis(7,[133 171]);
tb = 2;
if code_rate == 1/2
    
    data=    vitdec(codedin,trellis,tb,'trunc','hard');
    
elseif  code_rate == 3/4
    puncpat = [1;1;0];
    data=    vitdec(codedin,trellis,tb,'trunc','hard',puncpat);
elseif code_rate == 2/3
    puncpat = [1;1;1;0];
    data=    vitdec(codedin,trellis,tb,'trunc','hard',puncpat);
else
    error("Enter a valid code rate ");
end



end