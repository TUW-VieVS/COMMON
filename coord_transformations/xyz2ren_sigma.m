% *************************************************************************
function [mren,invrot]=xyz2ren_sigma(mxyz,phi,lam)

l1=size(mxyz);
l2=size(phi);
l3=size(lam);

l1=l1(1);
l2=l2(1);
l3=l3(1);

eq= isequal(l1,l2,l3);
if eq==0
    fprintf('Number of rows in dxyz, phi and lam must be the same! \n')
end


for i=1:l1
    phi1=phi(i);
    lam1=lam(i);
    rot =  [cos(phi1)*cos(lam1), -sin(lam1), -sin(phi1)*cos(lam1);
            cos(phi1)*sin(lam1),  cos(lam1), -sin(phi1)*sin(lam1);
            sin(phi1)          ,          0,  cos(phi1)          ];
        
    res=(inv(rot)*diag(mxyz(i,:))*inv(rot)')';
    mren(i,:)=diag(res);
    clear res
end    

invrot=inv(rot);
