clc;
clear all;

filename = 'testfile.txt'

f = fopen(filename);
data = textscan(f,'%s');
fclose(f);
Reflectivity = str2double(data{1}(2:2:end));
Energy = str2double(data{1}(1:2:end));

Eend = 3000;
step = 1;
Efirst = 267.24;
num_harmonics = 5;
fwhm = 0.3;

[energies, intensities] = harmonics(Eend, step, Efirst, num_harmonics, fwhm);

figure(1)

plot(energies, intensities)
title('Figure 1: Initial Beam')
xlabel('Energy, E (eV)')
ylabel('Intensities, (normalized)')


R = interp1(Energy', Reflectivity', energies);

I = R.*R.*R.*R.*intensities;
figure(2)

plot(energies, R)
title('Figure 2: Reflectivity for SiO_2 at an angle 5 degrees')
xlabel('X-ray Energy (eV)')
ylabel('Relectivity')

figure(3)
plot(energies, I)
title('Figure 3: Final Beam Intensity')
xlabel('X-ray Energy (eV)')
ylabel('Intensity')
