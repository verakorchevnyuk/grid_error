function [ coordinatesMax ] = find_maximum( energyMap , center )
% the function yields the further away max

foundMax = 0;
coordinatesMax = center;

for n = 1:size(energyMap,1)
    for m = 1:size(energyMap,2)
        tmp = energyMap(n,m);
        if ( tmp > foundMax )
            foundMax = tmp;
            coordinatesMax = [n,m];
        elseif ( tmp == foundMax )
            if ( norm(coordinatesMax-tmp) > norm(coordinatesMax-foundMax) )
                foundMax = tmp;
                coordinatesMax = [n,m];
            end
        end
    end
end

end

