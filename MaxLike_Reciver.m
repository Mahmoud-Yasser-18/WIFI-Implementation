function [result,binary_map]=MaxLike_Reciver(complex_signal,mod_type,ref_cons)

    result=zeros(1,length(complex_signal));
    m=log2(length(ref_cons));
    binary_map=zeros(1,length(complex_signal)*m);
    for i= 1: length (complex_signal)
        [M,result(i)] = min(abs(ref_cons-complex_signal(i)));
        binary_map(1+(i-1)*m:i*m)=de2bi(result(i)-1,m);
    end

end
