function [fids] = duct_IC()
% Writes duct initial concentration data, use in conjunction with
% duct_icon, duct_junctions, and duct_segments
% See C:\_Research\Tests\CONTAM\PRJ_Text_Editing\Duct for more on duct parameters

% Assumes every junction has same initial concentration

%% Define and Initialize Variables

% Contaminants
% ctm_nm = {'CO2','Ozone','PM2.5'};
% ctm_val = [5.970e-004, 3.900e-008, 1.530e-008];
ctm_nm = {'CO2_tracer'};
ctm_val = [5.970e-004];
nctm = numel(ctm_val);

% Project Boundaries
zpr = 50; % number of zones per row
nr = 33; % number of rows per level
l = 1; % number of levels
nr = nr - 1; % number of rows of ducts
nJ = 4*(zpr - 1)*nr*l; % number of junctions

% File to Write to
fids = 'duct_IC.txt';
fid = fopen(fids,'w+');

Ji = 1; % 1st junction element number (# junctions already in project + 1)

%% Main Program

fprintf(fid,'%d\n', nctm*nJ); % Print number initial junction concentrations

% Print Header

fprintf(fid,'! J#');

for cntmc = 1:nctm % print each contaminant name
    
    fprintf(fid,' %s', ctm_nm{cntmc});
    
end

fprintf(fid,'\n');

% Print Data

for Jc = Ji:nJ % for each row on the icon location grid
    
    fprintf(fid,' %d', Jc);
    
    for cntmc = 1:nctm % print each contaminant value
        
        fprintf(fid,' %d', ctm_val(cntmc));
        
    end
    
    fprintf(fid,'\n');
    
end

fclose(fid);

end