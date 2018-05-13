% fs = 48e3;
% 
% % Get mics position
% numMics = 8;
% radius = 0.1; %meters
% mics = get_circle_positions (numMics, radius, 0);
% 
% % Create theoretical grid
% dim1 = 5; %meters
% dim2 = 3; %meters
% gridSize = 0.05; %meters
% 
% % center of room
% roomCenter = [ dim1/2, dim2/2 ];
% for n = 1:numMics
%     mics (n,:) = mics (n,:) + roomCenter;
% end
% 
% % Make microphone pairs
% pairs = cell(round(numMics/2),2);
% for n = 1:round(numMics/2)
%     pairs (n,1) = {mics(n, :)};
%     pairs (n,2) = {mics(round(numMics/2) + n , :) };
% end
% numPairs = size(pairs,1);
% 
% % theoretical grid
% for n = 1:numPairs
%     thetas{n} = create_theta_mtx(dim1, dim2, gridSize, pairs(n,:), fs);
% end
% 
% % get gcc curves
% ss = [5, 3];
% for n = 1:numPairs
%     gccCurves{n} = get_gcc_phat_curve(ss, pairs(n,:), fs);
% end
% 
% % voting
% energyMap = build_energy_map (thetas, gccCurves);
% 
% % plot energy map
% imshow(sum(energyMap,3),[]);
% 
% % output angle
% center = [dim1/2 dim2/2];
% sourceFound = find_maximum(energyMap, center );
% sourceFound = sourceFound .* gridSize;
% sourceFound = sourceFound-roomCenter;
% sourceFound = sourceFound/norm(sourceFound);
% 
% % get angle
% obtainedAngle = rad2deg (atan2(sourceFound(2),sourceFound(1)));
% 
% % comupte expected angle
% sourceReal = ss;
% sourceReal = sourceReal - roomCenter;
% sourceReal = sourceReal / norm(sourceReal);
% realAngle = rad2deg (atan2(sourceReal(2),sourceReal(1)));
% 
% % error
% resultError = realAngle - obtainedAngle

%% Run for several source positions

fs = 48e3;

% Get mics position
numMics = 8;
radius = 0.1; %meters
mics = get_circle_positions (numMics, radius, 0);

% Create theoretical grid
dim1 = 7; %meters
dim2 = 6; %meters
gridSize = 0.05; %meters

% center of room
roomCenter = [ dim1/2, dim2/2 ];
for n = 1:numMics
    mics (n,:) = mics (n,:) + roomCenter;
end

% Make microphone pairs
pairs = cell(round(numMics/2),2);
for n = 1:round(numMics/2)
    pairs (n,1) = {mics(n, :)};
    pairs (n,2) = {mics(round(numMics/2) + n , :) };
end
numPairs = size(pairs,1);

% theoretical grid
for n = 1:numPairs
    thetas{n} = create_theta_mtx(dim1, dim2, gridSize, pairs(n,:), fs);
end


% build error matrix
distMin = 0.2 ;
distMax = 3 ;
numDist = 11 ;
angleMin = 0 ;
angleMax = 360 ; 
numAngle = 11 ;
sliceDist = 0.1 ; % number between 0 and 1 (the smaller, the closer to the microphones)
sliceAngle = 0.4 ; % number between 0 and 1 (the smaller, the closer to zero degrees)

[ errorRealApprox ] = obtain_error( distMin, distMax, numDist, angleMin, angleMax, numAngle, pairs, thetas, fs, roomCenter, gridSize );
