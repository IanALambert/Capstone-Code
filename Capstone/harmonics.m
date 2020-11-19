function [energies, intensities]=harmonics(Eend, step, Efirst, num_harmonics, fwhm)
%{
Inputs:
- Eend is the maximum energy of the energy spectrum
- step is the energy step to be used
- Efirst is the energy of the first harmonic used
- num_harmonics is the number of harmonics to be used
- fwhm is the full width half maximum of the gaussian 
Outputs:
- energies is a list of the energies associated to the incoming beam
- intensities is a list of the intensities of the incoming beam
%}

energies = 30:step:Eend; % initializes the energies of the beam

intensities = zeros(1,length(energies)); % initializes the intensity of the beam

% determines the harmonics and creates the gaussians for each harmonic
for i=1:num_harmonics+1
    n = i-1;
    if n == 0
        harmonicenergy = Efirst;
    elseif n ~= 0
        harmonicenergy = Efirst*(2*n);
    end
    
    f = (1*0.5^n)*exp(-(energies-harmonicenergy).^2./(2*fwhm^2));
    n
    intensities = intensities + f;
    
    
end
end


