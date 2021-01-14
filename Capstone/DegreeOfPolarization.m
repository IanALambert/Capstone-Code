function [theta_1,theta_2, Is,Ip] = DegreeOfPolarization(n1,n2,numR)

% Determining the incident and relected angles
theta_1 = 0:0.00001:pi/2;
theta_2 = asin((n1/n2).*sin(theta_1));

% Determine the reflection coefficients
rp = tan(theta_1-theta_2)./tan(theta_1+theta_2);
rs = sin(theta_1-theta_2)./sin(theta_1+theta_2);

% Determine the intensities
Ip = (rp.^numR).^2;
Is = (rs.^numR).^2;

% Calculate the degree of polarization

end