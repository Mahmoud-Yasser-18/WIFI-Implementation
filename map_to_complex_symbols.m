function complex_signal = map_to_complex_symbols(Seq,mod_type)

    if mod_type == "BPSK"
        PSK_M=2;
        PSK_m= log2(PSK_M);
        index= 1:PSK_M;
        ref_cons=cos(2*pi*(index-1)/PSK_M)+1i*sin(2*pi*(index-1)/PSK_M); % Reference Constellation 
        len_trans=length(Seq)-mod(length(Seq),PSK_m);
        complex_signal=zeros(1,len_trans/PSK_m);
        c= 0;
        for i= 1:PSK_m:len_trans
            c=c+1;
            map=bi2de(Seq(i:i+PSK_m-1));
            complex_signal(c)= ref_cons(map+1);
        end

    elseif mod_type =="QPSK"
        PSK_M=4;
        PSK_m= log2(PSK_M);
        index= 1:PSK_M;
        ref_cons=cos(2*pi*(index-1)/PSK_M + pi/4)+1i*sin(2*pi*(index-1)/PSK_M + pi/4); % Reference Constellation 
        len_trans=length(Seq)-mod(length(Seq),PSK_m);
        complex_signal=zeros(1,len_trans/PSK_m);
        c= 0;
        for i= 1:PSK_m:len_trans
            c=c+1;
            map=bi2de(Seq(i:i+PSK_m-1));
            complex_signal(c)= ref_cons(map+1);
        end
        
        
    elseif mod_type== "16QAM"
        QAM_M=16;
        L= sqrt(QAM_M);
        QAM_m=log2(QAM_M);
        L_vector= -L+1:2: L-1; 
        ref_cons=zeros (1,QAM_M);
        for i=1:L 
            ref_cons(1+(i-1)*L:i*L)=L_vector+1i*L_vector(end-(i-1));
        end



        len_trans=length(Seq)-mod(length(Seq),QAM_m);
        complex_signal=zeros(1,len_trans/QAM_m);
        c= 0;
        for i= 1:QAM_m:len_trans
            c=c+1;
            map=bi2de(Seq(i:i+QAM_m-1));
            complex_signal(c)= ref_cons(map+1);
        end

    elseif mod_type== "64QAM"
        QAM_M=64;
        L= sqrt(QAM_M);
        QAM_m=log2(QAM_M);
        L_vector= -L+1:2: L-1; 
        ref_cons=zeros (1,QAM_M);
        for i=1:L 
            ref_cons(1+(i-1)*L:i*L)=L_vector+1i*L_vector(end-(i-1));
        end



        len_trans=length(Seq)-mod(length(Seq),QAM_m);
        complex_signal=zeros(1,len_trans/QAM_m);
        c= 0;
        for i= 1:QAM_m:len_trans
            c=c+1;
            map=bi2de(Seq(i:i+QAM_m-1));
            complex_signal(c)= ref_cons(map+1);
        end
    else
        error(" The modulation type must be one of the following : BPSk , QBSK , 16QAM or 64QAM");
    end 


end 