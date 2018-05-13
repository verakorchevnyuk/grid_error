function [ vReal, vApprox ] = obtain_v( ssDist, ssAngle )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

numMics = 8;
diamArray = 0.2;

[ M, DReal, DApprox ] = obtain_M_Dreal_Dapprox( numMics, diamArray, ssDist, ssAngle );

vReal = M \ DReal ;

vApprox = M \ DApprox ;

end

