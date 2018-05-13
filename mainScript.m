distMin = 1e-12 ;
distMax = 3 ;
numDist = 100 ;
angleMin = 0 ;
angleMax = 360 ; 
numAngle = 100 ;
sliceDist = 0.1 ; % number between 0 and 1 (the smaller, the closer to the microphones)
sliceAngle = 0.4 ; % number between 0 and 1 (the smaller, the closer to zero degrees)

[ errorRealApprox ] = obtain_error( distMin, distMax, numDist, angleMin, angleMax, numAngle );


distVector = linspace ( distMin, distMax, numDist );
angleVector = linspace ( angleMin, angleMax, numAngle );
represent_error ( errorRealApprox, distVector, angleVector, sliceDist, sliceAngle );