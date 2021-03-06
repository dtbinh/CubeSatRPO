function createSTKfile(sat)
%% Trajectory
filename = strcat(sat.name,'.e');
fileID = fopen(filename,'w');
fprintf(fileID,'stk.v.8.0\r\n\r\nBEGIN Ephemeris\r\n\r\n');
fprintf(fileID,'NumberOfEphemerisPoints %d\r\n',length(sat.x));
fprintf(fileID,'CoordinateSystem Custom RIC Satellite/Origin\r\n\r\n');
fprintf(fileID,'EphemerisTimePosVel\r\n\r\n');

for ii = 1:length(sat.x);
    fprintf(fileID,'%f %f %f %f %f %f %f\r\n',sat.t(ii),sat.x(ii),sat.y(ii),sat.z(ii),...
        sat.vy(ii),-sat.vz(ii),-sat.vx(ii));
end

fprintf(fileID,'END Ephemeris');
fclose(fileID);

%% Attitude
filename = strcat(sat.name,'.a');
fileID = fopen(filename,'w');
fprintf(fileID,'stk.v.8.0\r\n\r\nBEGIN Attitude\r\n\r\n');
fprintf(fileID,'NumberOfAttitudePoints %d\r\n',length(sat.x));
fprintf(fileID,'CoordinateSystem Custom RIC Satellite/Origin\r\n\r\n');
% fprintf(fileID,'AttitudeTimeQuatAngVels\r\n\r\n');
fprintf(fileID,'AttitudeTimeQuaternions\r\n\r\n');

for ii = 1:length(sat.x);
    fprintf(fileID,'%f %f %f %f %f\r\n',sat.t(ii),sat.q1(ii),sat.q2(ii),sat.q3(ii),sat.q4(ii));
end

fprintf(fileID,'END Attitude');
fclose(fileID);
end