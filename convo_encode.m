function codeddata = convo_encode(data,code_rate)

trellis = poly2trellis(7,[133 171]);
if code_rate == 1/2
    
    codeddata=convenc(data,trellis);
    
elseif  code_rate == 3/4
    puncpat = [1;1;0];
    codeddata=convenc(data,trellis,puncpat);
elseif code_rate == 2/3
    puncpat = [1;1;1;0];
    codeddata=convenc(data,trellis,puncpat);
end 
