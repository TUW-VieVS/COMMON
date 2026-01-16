% Hana Krasna
% 2025-12-22, covariance added to formal error transformation

% *************************************************************************
function [mhen]=xyz2ren_CorrelSigma(phi,lam,Qxyz,x_)

l1=size(Qxyz,1)/3;
l2=size(phi,1);
l3=size(lam,1);

eq= isequal(l1,l2,l3);
if eq==0
    fprintf('Dimension of Qxyz, phi and lam must be the same! \n')
end


rot =  [diag(cos(phi).*cos(lam)), diag(-sin(lam))   , diag(-sin(phi).*cos(lam));
        diag(cos(phi).*sin(lam)),  diag(cos(lam))   , diag(-sin(phi).*sin(lam));
        diag(sin(phi))          ,  diag(zeros(l1,1)),  diag(cos(phi))          ];

res=(inv(rot)*Qxyz*inv(rot)')'; %cm^2
mren=sqrt(diag(res))./100.*x_.mo; %m

mhen = reshape(mren,l1,3);