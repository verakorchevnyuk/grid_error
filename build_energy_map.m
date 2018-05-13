function [ energyMap ] = build_energy_map( thetas, gccCurves )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

energyMap = zeros(size(cell2mat(thetas(1))));

for n = 1:size(energyMap,1)
    for m = 1:size(energyMap,2)
        for p = 1:length(thetas)
            idx = thetas{p}(n,m);
            if (idx <= 0) idx = idx + length(gccCurves{p}); end %condition
            energyMap (n,m) = energyMap(n,m) + gccCurves{p}( idx );
        end
    end
end

end

