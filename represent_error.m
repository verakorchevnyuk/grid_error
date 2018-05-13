function [  ] = represent_error( errorMtx , distVector, angleVector , rDist, rAngle )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

rRange = 0.5;
figure
subplot(1,3,1)
%surf(distVector, angleVector, errorMtx);
mesh(angleVector, distVector, errorMtx);
xlabel ('angle (degrees)'); % x & y are switched !!
ylabel ('dist (m)');
zlabel ('error (degrees)');
title ( ' Variation with distance and angle');

% check variation with distance
subplot (1,3,2)
chosenAngle = round(length(errorMtx(:,1)) * rAngle) ;
if ( chosenAngle == 0 ) chosenAngle = 1 ; end
plot ( distVector , errorMtx( : , chosenAngle ) ) ;
axis ([ distVector(1) distVector(length(distVector)) -rRange rRange ]);
xlabel ( 'dist (m) ');
ylabel ('error (degrees)');
sTitleDist = sprintf ( 'variation with the distance. fixed angle = %0.2f º' , angleVector(chosenAngle) );
title ( sTitleDist);


% check variation with angle
subplot (1,3,3)
chosenDist = round (length(errorMtx(1,:)) * rDist) ;
if ( chosenDist == 0 ) chosenDist = 1; end
plot ( angleVector, errorMtx ( chosenDist , :)' ) ;
axis ([ angleVector(1) angleVector(length(angleVector)) -rRange rRange ]);
xlabel ( 'angle (degrees) ');
ylabel ('error (degrees)');
sTitleAngle = sprintf ( 'variation with the angle. fixed dist = %0.2f m ' , distVector(chosenDist) );
title ( sTitleAngle );

end

