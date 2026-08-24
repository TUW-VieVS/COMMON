% fast version of lagrange interpolation (degree 9 - 10 points)
% ======================
% takes ten points (five x smaller, five x bigger than xInt) and computes a
% polynomial of nineth degree. If there are less then the needed four 
% values given (e.g. when time series (x,y) is too small), this function 
% produces an error - no checks are done for performance reason.
%
% INPUT
%   x ... given x values [nx1] or [1xn] (must be distinct values especially
%         when you want to interpolate this value, then the return are two
%         values)
%   y ... corresponding y values (same size as x)
%   xInt. vector of x values to be interpolated [1xm] or [mx1]
%
% OUPUT
%   yInt. corresponding (to xInt) interpolated values 
%
% CREATED
%   01 August 2026 Helene Wolf

function yInt = lagint9_fast(x, Y, xInt)

    [nData, nComp] = size(Y);
    nInt = length(xInt);
    
    xInt_num = double(xInt);
    ind = discretize(xInt_num, x);
    
    % Boundary Check
    if any(isnan(ind)) || any(ind < 6) || any(ind > nData - 4)
        error('Interpolation point outside valid range.');
    end

    yInt = zeros(nInt, nComp);

    for k = 1:nInt
        curr_ind = ind(k);
        idx = (curr_ind-5):(curr_ind+4);
        
        xLoc = x(idx);
        YLoc = Y(idx, :); 
        
        weights = zeros(10, 1);
        for i = 1:10
            others = setdiff(1:10, i);
            num = prod(xInt(k) - xLoc(others));
            den = prod(xLoc(i) - xLoc(others));
            weights(i) = num / den;
        end
        
        yInt(k, :) = weights' * YLoc;
    end
    yInt = yInt';
end