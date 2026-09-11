% deg2dms Convert decimal degrees to degrees, minutes, and seconds.
%
% Input:
%   decimalDeg - Angle in decimal degrees
%
% Outputs:
%   deg - Degrees
%   min - Arc minutes
%   sec - Arc seconds
%
% Example:
%   [deg, min, sec] = deg2dms(48.8566)
%   % Result: 48 deg, 51 min, 23.76 sec
%
function dms = deg2dms(decimalDeg)
    % Extract the degrees
    deg = fix(decimalDeg);

    % Calculate the remaining fractional degrees
    decimalMinutes = abs(decimalDeg - deg) * 60;

    % Extract the minutes
    min = fix(decimalMinutes);

    % Calculate the remaining seconds
    sec = (decimalMinutes - min) * 60;

    dms = [deg min sec];
end