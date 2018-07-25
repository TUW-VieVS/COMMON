function [ str ] = datetime2yydddsssss( date )

y = year(date);
d = floor(datenum(date))-datenum(y,1,1)+1;
s = mod(datenum(date),1)*86400;
str = sprintf('%4d:%03d:%05d',y,d,round(s));
str = str(3:end);
end

