function [ angleRealMtx, angleApproxMtx ] = obtain_angle_Mtxs( vRealMtx, vApproxMtx )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

angleRealMtx = zeros(size(vRealMtx(:,:,1)));
angleApproxMtx = angleRealMtx;

for n = 1 : size(vRealMtx,1)
    for m = 1 : size (vRealMtx, 2)
        angleRealMtx(n,m) = atan2d ( vRealMtx(n,m,2) , vRealMtx(n,m,1) );
        angleApproxMtx(n,m) = atan2d ( vApproxMtx(n,m,2), vApproxMtx(n,m,1) );
    end
end

end

