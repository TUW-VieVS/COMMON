function [ date ] = yydddsssss2datetime( yy,ddd,sssss )
% converts "yy:ddd:sssss" time UTC to datetime object
%       
% INPUT: timeString = "yy:ddd:sssss" where:
%       yy =    last 2 digits of the year
%                   yy <=50 implies 21-st century
%                   yy >50 implies 20-th century
%       ddd =   3-digit day in year
%       sssss = 5-digit seconds in day
% created: Matthias Schartner (24.08.2016)
YY = zeros(size(yy));

YY(yy<=50) = 2000+yy(yy<=50);
YY(yy>50)  = 1900+yy(yy>50);

date = datetime(YY,1,1);
date = date+ddd-1+sssss/86400;

end

