function [ M, DReal, DApprox ] = obtain_M_Dreal_Dapprox( numMics, diamArray, ssDist, ssAngle )

% Microphones
angles  = linspace (0, 2*pi, numMics+1);
angles = angles (1:end-1);

M = zeros(numMics, 2);

for i = 1:numMics
    [ M(i,1), M(i,2) ] = pol2cart ( angles(i), diamArray / 2 ) ;
end

% Centroid
c = sum(M,1) / numMics;

% Sound source
ssAngle = ssAngle * pi  / 180 ; 
[ss(1), ss(2)] = pol2cart (ssAngle, ssDist);

% Direction vector
v = (ss-c) / norm (c-ss);

% D real
DReal = zeros(numMics, 1);

for i = 1:numMics
    DReal(i,1) = norm ( ss - M(i,:) ) ;
end

% D approximated
DApprox = zeros (numMics,1);

tmp = zeros (numMics, 2);

for i = 1:numMics
    tmp (i,:) = ss - M(i,:);
    DApprox (i) = dot (v, tmp(i,:));
end

end

