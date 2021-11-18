function RetrieveFile(data,outfile)
recChar= char(bin2dec(reshape(char(data+'0'), 8,[]).'));
recfile = fopen(outfile,'w');
fprintf(recfile,recChar,'%s');
end