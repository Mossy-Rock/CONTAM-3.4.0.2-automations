function [savename] = wth2cntmfact(wthname)

%% Get Values
[date,time,T,P,Ws,Wd,W,~,~,~,~,~] = importwth_hr(wthname); % import data

P_ws = 0.61121.*exp((18.678 - ((T - 273.15)./234.84)).*((T - 273.15)./(T - 16.01))); % calculate saturation vapor pressure in Pa
Rh = (W.*P)./(621379.310344828.*P_ws); % calculate Rh

w_data = [T,P,Ws,Wd,Rh];

n = numel(date);

% Make state names
state = [datestr(date, 'mm_DD'), repmat('_', n, 1), datestr(time, 'HH')];

% modify state names to fit CONTAM time format
loc = find(time  == '00:00:00');
state(loc, [1:5]) = datestr(datetime(state(loc, [1:5]), 'InputFormat', 'M_dd') - 1, 'mm_dd');
state(loc, [7:8]) = repmat('24', numel(loc), 1);


%% Print to File
% Initialize file
savename = [wthname(1:(end - 3)), 'txt'];
fid = fopen(savename, 'w+');

fprintf(fid,'! nSets\n  1\n! nCh nStates SetName\n6    %d      W   ! Airflow path parameters\n', n); % Print number of sets, changes, states, and setnames

% Print state names
for i = 1:n
    fprintf(fid,'%s ', state(i,:));
    
end

fprintf(fid,'! State Names\n');

% Print values
for j = 1:size(w_data,2)
    for i = 1:n % print row
        fprintf(fid,'%.3f ', w_data(i,j));
        
    end
    
    fprintf(fid, '! $(W %d)\n', j);
    
end

fclose(fid); % close file

end