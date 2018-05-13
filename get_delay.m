function [ delay ] = get_delay( sourcePos, pair, fs )
%resulting delay in samples


k = 343.42; % speed of sound (m/s)

micA = cell2mat(pair(1));
micB = cell2mat(pair(2));

dA = norm (sourcePos - micA);
dB = norm (sourcePos - micB);
delay = round( (dA - dB) / k * fs );

end

