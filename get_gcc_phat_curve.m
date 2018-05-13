function [ gccCurve ] = get_gcc_phat_curve( sourcePos, pair, fs )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

% generate random signal
sig = randn(1,1024);

% get delayed signal
delay = get_delay (sourcePos, pair, fs);
sigDelayed = add_delay_to_signal (sig, -delay / fs, fs );

% gcc phat
gccCurve =  real(ifft(fft(sig) .* conj(fft(sigDelayed))./(norm(sig).*norm(sigDelayed))) );

end

