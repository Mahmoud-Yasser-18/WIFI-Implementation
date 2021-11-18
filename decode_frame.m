function [final_data] = decode_frame(frame,equ_type,SNR,ref_cons, fixed)
    % long traning preamble part
    preamble2 = create_large_preamble();
    
    % use perample2  for weiner filtering or zero forcing
    % extract long preamble
    frame = double(frame);
    preamble = [frame(2*80+1:3*80);frame(3*80+1:4*80)];
    % remove cyclic prefix
    cyclic = 16;
    preamble = preamble(:,cyclic+1:end);
    
    % FFT to decode OFDM
    preamble = [fft(preamble(1,:),64); fft(preamble(2,:),64)];
    preamble = mean(preamble,1);
    %MAKE FIXED POINT HERE
    if fixed == true
        preamble = fi(preamble,1,32,24);
        preamble2= fi(preamble2,1,16,12);
    end
    % Return channel gains H
    H = preamble./preamble2;
 
    
    
  
    % Finding code rate and mod_type
    signal_OFDM_symbole=  frame(4*80+1:5*80);
    signal_ref_cons = create_ref_symbols('BPSK');
    signal_data=decode_OFDM_symboles(signal_OFDM_symbole,"BPSK",0.5,H,equ_type,SNR,signal_ref_cons,fixed);
    [mod_type,code_rate] = decode_rate(signal_data(1:4));
    len = bi2de(signal_data(5:4+12),'left-msb');
%     disp(len)
    data=decode_OFDM_symboles(reshape(frame(5*80+1:end),80,[]).',mod_type,code_rate,H,equ_type,SNR,ref_cons,fixed);
    final_data=data(1:len*8);

end