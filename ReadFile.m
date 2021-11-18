function [dataBin] =ReadFile(filename,numberOfBits)
file = fopen(filename,'r');
data = fscanf(file,'%c',[1,inf]);
dataBin = reshape(dec2bin(data, numberOfBits).'-'0',1,[]);
end