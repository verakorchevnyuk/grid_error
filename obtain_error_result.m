function [ resultError ] = obtain_error_result ( sourcePos, pairs, thetas, fs, roomCenter, cellSize )

numPairs = size(pairs,1);

% get gcc curves
ss = sourcePos;
for n = 1:numPairs
    gccCurves{n} = get_gcc_phat_curve(ss, pairs(n,:), fs);
end

% voting
energyMap = build_energy_map (thetas, gccCurves);

% plot energy map
imshow(sum(energyMap,3),[]);

% output angle
sourceFound = find_maximum(energyMap, roomCenter );
sourceFound = sourceFound .* cellSize;
sourceFound = [sourceFound(2), sourceFound(1)];
sourceFound = sourceFound - roomCenter;
sourceFound = sourceFound/norm(sourceFound);

% get angle
obtainedAngle = atan2d(sourceFound(2),sourceFound(1));

% comupte expected angle
sourceReal = ss;
sourceReal = sourceReal - roomCenter;
sourceReal = sourceReal / norm(sourceReal);
realAngle =  atan2d (sourceReal(2),sourceReal(1));

% error
resultError = realAngle - obtainedAngle;



end

