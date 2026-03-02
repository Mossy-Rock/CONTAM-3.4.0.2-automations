function [fids] = duct_segments()
% Writes duct segment data, use in conjunction with
% duct_IC, duct_icon, and duct_junctions
% See C:\_Research\Tests\CONTAM\PRJ_Text_Editing\Duct for more on duct parameters

%% Define and Initialize Variables

% Project Boundaries
zpr = 50; % number of zones per row
nr = 33; % number of rows per level
nr = nr - 1; % number of rows of ducts
spr = 2*(zpr - 1); % number of segments per row

% File to Write to
fids = 'duct_segments.txt';
fid = fopen(fids,'w+');

D = 1; % 1st junction segment number (# segments already in project + 1)

%% Main Program

% for l = 1:6 % for each level
%
%     fprintf(fid,'Level %d. Do not copy to .prj\n', l); %
%
%     if rem(l,2) == 1 % occupied level
%         h = 1.37;
%
%     else % plenum
%         h = 0.63;
%
%     end

for yc = 1:nr % for each row on the icon location grid
    
    n = [(1 + 4*(yc - 1)*(zpr - 1)):((4*(yc - 1) + 1)*(zpr - 1)), 1 + 2*(zpr - 1) + 4*(yc - 1)*(zpr - 1):2:(4*yc*(zpr - 1) - 1)];
    m = [(2 + (4*(yc - 1) + 2)*(zpr - 1)):2:(4*yc*(zpr - 1)), (1 + (4*yc - 3)*(zpr - 1)):((4*yc - 2)*(zpr - 1))];
    
    for xc = 1:spr % for each icon in the ycth row of the location grid
        
        fprintf(fid,' %d 0 %d %d 1 0 0 0 2 0 0.0314159 0.0314159 0 -1 0 0 0\n', D, n(xc), m(xc));
        D = D+1;
        
    end
end
% end

fclose(fid);

end