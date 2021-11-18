function [ref_cons,m] = create_ref_symbols(mod_type)
     if mod_type == "BPSK"
        PSK_M=2;
        PSK_m= log2(PSK_M);
        m = PSK_m;
        index= 1:PSK_M;
        ref_cons=cos(2*pi*(index-1)/PSK_M)+1i*sin(2*pi*(index-1)/PSK_M); % Reference Constellation 
    elseif mod_type =="QPSK"
        PSK_M=4;
        PSK_m= log2(PSK_M);
         m = PSK_m;
        index= 1:PSK_M;
        ref_cons=cos(2*pi*(index-1)/PSK_M + pi/4)+1i*sin(2*pi*(index-1)/PSK_M + pi/4); % Reference Constellation 

        
        
    elseif mod_type== "16QAM"
        QAM_M=16;
        L= sqrt(QAM_M);
        m = 4;
        QAM_m=L;
        L_vector= -L+1:2: L-1; 
        ref_cons=zeros (1,QAM_M);
        for i=1:L 
            ref_cons(1+(i-1)*L:i*L)=L_vector+1i*L_vector(end-(i-1));
        end


    elseif mod_type== "64QAM"
        QAM_M=64;
        L= sqrt(QAM_M);
        m = 6;
        L_vector= -L+1:2: L-1; 
        ref_cons=zeros (1,QAM_M);
        for i=1:L 
            ref_cons(1+(i-1)*L:i*L)=L_vector+1i*L_vector(end-(i-1));
        end

    else
        error(" The modulation type must be one of the following : BPSK , QBSK , 16QAM or 64QAM");
    end 
end 