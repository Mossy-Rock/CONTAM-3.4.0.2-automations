function [fids] = duct_junctions()
% Writes individual duct junction data, use in conjunction with
% duct_IC, duct_icon, and duct_segments
% See C:\_Research\Tests\CONTAM\PRJ_Text_Editing\Duct for more on duct parameters

%% Define and Initialize Variables

% Project Boundaries
zpr = 50; % number of zones per row
nr = 33; % number of rows per level
nr = nr - 1; % number of rows of ducts
Jpr = 4*(zpr-1); % number of junctions per row

% File to Write to
fids = 'duct_junctions.txt';
fid = fopen(fids,'w+');

J = 0; % 1st junction element number - 1 (# junctions already in project)

% Location of Icons
x = [1.3:(zpr - 0.7); 1.5:(zpr - 0.5)];
x = [1.3:-0.7+zpr,  1.7:-0.3+zpr, x(:)'];

y = [repmat([1],[1,(zpr-1)]),repmat([3],[1,(zpr-1)]),repmat([5],[1,2*(zpr-1)])]/10;

% Direction of Ducts and Flows
ddir = [repmat([2],[1,(zpr-1)]),repmat([5],[1,(zpr-1)]),repmat([1],[1,2*(zpr-1)])];
fdir = [repmat([5],[1,(zpr-1)]),repmat([2],[1,(zpr-1)]),repmat([4],[1,2*(zpr-1)])];

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

for yc = 1:nr % for each row
    
    % Update y
    y = y + 1;
    % Create z
    z = [(1 + (yc - 1)*zpr):((zpr - 1) + (yc - 1)*zpr), (2 + (yc - 1)*zpr):(yc*zpr), ceil((1 + yc*zpr):0.5:((yc + 1)*zpr - 0.5))];
    
    for xc = 1:Jpr % for each junction in the row
        
        J = J+1; % update J
        fprintf(fid,' %d 0 1 %d 0 0 0 0 1 %.3f %.3f 1.730 293.15 0 162 -1 0 0 2 0 0 T: 0 0 0 0 -1 0 2.74 2.74 0 0.001 0 0.8 0 4 %d %d\n', J, z(xc), x(xc), y(xc), ddir(xc), fdir(xc));
        
    end
end
% end

fclose(fid);

end