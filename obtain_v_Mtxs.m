function [ vRealMtx , vApproxMtx ] = obtain_v_Mtxs( distMin, distMax, numDist, angleMin, angleMax, numAngle )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

vRealMtx = zeros ( numDist, numAngle, 2);
vApproxMtx = zeros ( numDist, numAngle, 2);

distVector = linspace (distMin, distMax, numDist);
angleVector = linspace (angleMin, angleMax, numAngle);

for n = 1:length(distVector)
    for m = 1:length(angleVector)
        [ vRealMtx(n,m,:), vApproxMtx(n,m,:) ] = obtain_v ( distVector( n ) , angleVector ( m ) );
    end
end


end

