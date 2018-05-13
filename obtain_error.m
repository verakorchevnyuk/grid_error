function [ errorMtx ] = obtain_error( distMin, distMax, numDist, angleMin, angleMax, numAngle, pairs, thetas, fs, roomCenter, gridSize )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

distVector = linspace(distMin, distMax, numDist);
angleVector = linspace(angleMin, angleMax, numAngle);


% obtain error
for a = 1:length(angleVector)
    for d = 1:length(distVector)
        [sourcePos(1), sourcePos(2)] = pol2cart( deg2rad(angleVector(a)), distVector(d));
        sourcePos = sourcePos + roomCenter;
        errorMtx (a,d) = obtain_error_result ( sourcePos, pairs, thetas, fs, roomCenter, gridSize );
    end
end



end