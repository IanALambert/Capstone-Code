function [energies, intensities]=harmonics(Eend, Efirst, num_harmonics, fwhm, IntFact)
%{
Inputs:
- Eend is the maximum energy of the energy spectrum
- step is the energy step to be used
- Efirst is the energy of the first harmonic used
- num_harmonics is the number of harmonics to be used (including the first
harmonic)
- fwhm is the full width half maximum of the gaussian 
- IntFact is an array [f1,f2,f3,....] that represent the fraction each
harmonic is with respect the the first harmonic f1.
Outputs:
- energies is a list of the energies associated to the incoming beam
- intensities is a list of the intensities of the incoming beam
%}

% This section of the code determine the step of the energy to be used
% in the plot based on the precision of the first harmonic
x = Efirst;
y = 0;
while (floor(x)~=x)
    y = y+1;
    y
    x = x*10;
end

step = 1^(-x); % Energy Step

energies = 30:step:Eend; % initializes the energies of the beam

intensities = zeros(1,length(energies)); % initializes the intensity of the beam

% determines the harmonics and creates the gaussians for each harmonic
for i=1:num_harmonics
    n = i-1;
    if n == 0
        harmonicenergy = Efirst;
    elseif n ~= 0
        harmonicenergy = Efirst*(2*n);
    end
    
    f = IntFact(i).*exp(-(energies-harmonicenergy).^2./(2*fwhm^2));
    
    intensities = intensities + f;
    
    
end
end


