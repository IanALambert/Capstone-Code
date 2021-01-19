% This script calculates plots the degree of polarization for a select
% input beam

% Linearly polarized
S0 = 1;
S1 = 0;
S2 = 0;
S3 = 1;

S = StokesParameters(S0,S1,S2,S3);

n1 = 1;
n2 = 1.55; %Silicone dioxide (SiO2)
numR = 1;

theta_i = 0.1:0.01:pi/2;
n_t = length(theta_i);
P = zeros(1,n_t);
Si = zeros(4, n_t);
for i=1:n_t
    M = MuellerStokesMatrix(n1,n2, theta_i(i));
    SR = StokesParametersReflections(S, M, numR);
    P(i) = PolarizationEval(SR, 4);
    Si(:,i) = SR;
    
end

figure(1)
plot(90-theta_i*180/pi, Si(1,:),'c',90-theta_i*180/pi, Si(2,:),'k--',90-theta_i*180/pi, Si(3,:),'r--',90-theta_i*180/pi, Si(4,:),'g--');
title("Resulting Polarization")
legend('S_0','S_1','S_2','S_3')
xlabel('Grazing Angle, \theta_G (degrees)')
ylabel('Intensity')


figure(2)
plot(90-theta_i*180/pi, P)