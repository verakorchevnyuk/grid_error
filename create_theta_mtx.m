function [ theta ] = create_theta_mtx( dim1, dim2, cellSize, pair, fs )
%every theta matrix corresponds to a pairs of mics

% grid
theta = zeros( round(dim2/cellSize), round(dim1/cellSize) );
sourcePosX = cellSize:cellSize:dim1;
sourcePosY = cellSize:cellSize:dim2;

for n = 1:length(sourcePosX)
    for m = 1:length(sourcePosY)
        ss = [ sourcePosX(n) , sourcePosY(m) ];
        theta (m,n) = get_delay( ss , pair , fs );
    end
end

end

