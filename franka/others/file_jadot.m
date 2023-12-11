 fid = fopen('jadot.txt','w');
 if fid > 0
     
     fprintf(fid, '[\n');
    arrayfun(@(ROWIDX) fprintf(fid, '%s,',Ja_dot(ROWIDX,1:end-1)) + fprintf(fid, '%s;\n', Ja_dot(ROWIDX,end)), (1:size(Ja_dot,1)).');
    fprintf(fid, ']\n');
     fclose(fid);
 end