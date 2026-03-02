function [] = zonetxt()

icntyp = 5;

n = 1;

fids = 'z1.txt';
fid = fopen(fids,'w+');

for y = 1:17
    
    for x = 1:23
        
        fprintf(fid,'  %d   %d   %d   %d\n', icntyp, 8*x-3, 8*y-3, n);
        n = n+1;
        
    end
end

fclose(fid);

end