function [] = zonetxt2(r,c)

lvl = 1;
vol =  2.74;

y = num2str(reshape(repmat([1:r],[c,1]), r*c,1),'%02.f');
x = num2str(reshape(repmat([1:c]',[1,r]), r*c,1), '%02.f');
z = repmat(['0',sprintf('%d', lvl)], [r*c,1]);
delim = repmat('.', [r*c,1]);

name = [z, delim, x, delim, y];


fids = 'z2.txt';
fid = fopen(fids,'w+');

for n = 1:r*c
    
    fprintf(fid,'   %d  3   0   0   0   %d   %.2f     %.2f 293.15 0 %s -1 1 3 1 1 0 0 0\n', n+1650*(lvl-1), lvl, vol, vol, name(n,:));
    
end

fclose(fid);

end