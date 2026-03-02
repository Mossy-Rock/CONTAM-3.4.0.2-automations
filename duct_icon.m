function [fids] = duct_icon()
% Writes duct data for icons in CONTAMW, use in conjunction with
% duct_IC, duct_junctions, and duct_segments
% See C:\_Research\Tests\CONTAM\PRJ_Text_Editing\Duct for more on duct parameters

%% Define and Initialize Variables

% Project Boundaries
zpr = 50; % number of zones per row
nr = 33; % number of rows per level
nr = nr - 1; % number of rows of ducts

% File to Write to
fids = 'duct_icon.txt';
fid = fopen(fids,'w+');

%% Main Program

% for l = 1:6 % for each level
%     
%     fprintf(fid,'Level %d. Do not copy this line to .prj\n', l); % 

for yc = 1:nr % for each row on the icon location grid - 1
    
    for xc = 1:(zpr - 1) % for each icon in the ycth row of the location grid - 1
        
        fprintf(fid,' 162 %d %d %d\n', 4 + 10*xc, 2 + 10*yc, xc + 4*(yc - 1)*(zpr - 1));
        fprintf(fid,' 155 %d %d %d\n', 5 + 10*xc, 2 + 10*yc, xc + 2*(yc - 1)*(zpr - 1));
        fprintf(fid,' 148 %d %d %d\n', 6 + 10*xc, 2 + 10*yc, xc + 2*(yc - 1)*(zpr - 1));
        fprintf(fid,' 147 %d %d %d\n', 4 + 10*xc, 4 + 10*yc, xc + (2*(yc - 1) + 1)*(zpr - 1));
        fprintf(fid,' 151 %d %d %d\n', 6 + 10*xc, 4 + 10*yc, xc + (2*(yc - 1) + 1)*(zpr - 1));
        fprintf(fid,' 155 %d %d %d\n', 7 + 10*xc, 4 + 10*yc, xc + (2*(yc - 1) + 1)*(zpr - 1));
        fprintf(fid,' 162 %d %d %d\n', 8 + 10*xc, 4 + 10*yc, xc + (4*(yc - 1) + 1)*(zpr - 1));
        fprintf(fid,' 162 %d %d %d\n', 4 + 10*xc, 6 + 10*yc, 2*xc + (4*(yc - 1) + 2)*(zpr - 1) - 1);
        fprintf(fid,' 162 %d %d %d\n', 6 + 10*xc, 6 + 10*yc, 2*xc + (4*(yc - 1) + 2)*(zpr - 1));
        
    end
end
% end

fclose(fid);

end