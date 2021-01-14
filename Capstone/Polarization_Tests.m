%% Degree of Polarization for a 4-Bounce Mirror
n1=1;
n2=1.55; % SiO2
% A single mirror
[theta_1, theta_2, Is, Ip] = DegreeOfPolarization(n1,n2,1);

grazing_angle = 90 - theta_1*180/pi;

figure(1)
plot(grazing_angle, Is, grazing_angle, Ip)
title("Polarization Intensity due to Reflections of One Mirror")
legend("S-Polarized","P-Polarized")
xlabel('Grazing Angle (degrees)')
ylabel('Intensity')

figure(2)
plot(grazing_angle, abs(Is-Ip)./(Is+Ip)*100)
title("Degree of Polarization for One Reflection")
xlabel("Grazing Angle (degrees)")
ylabel("Degree of Polarization (%)")

%% Degree of Polarization for a 4-Bounce Mirror
n1=1;
n2=1.55; % SiO2
% 4 Reflections
[theta_1, theta_2, Is, Ip] = DegreeOfPolarization(n1,n2,4);

grazing_angle = 90 - theta_1*180/pi;

figure(1)
plot(grazing_angle, Is, grazing_angle, Ip)
title("Polarization Intensity due to Reflections of One Mirror")
legend("S-Polarized","P-Polarized")
xlabel('Grazing Angle (degrees)')
ylabel('Intensity')

figure(2)
plot(grazing_angle, abs(Is-Ip)./(Is+Ip)*100)
title("Degree of Polarization for One Reflection")
xlabel("Grazing Angle (degrees)")
ylabel("Degree of Polarization (%)")

%%


n1 = 1;
numR = 4;

n2 = 1.1:0.01:2.0;
n = length(n2);
max_angle = zeros(1,n);

for i=1:n
    [theta_1, theta_2, Is, Ip] = DegreeOfPolarization(n1,n2(i), numR);
    grazing_angle = 90 - fliplr(theta_1)*180/pi;
    Is_f = fliplr(Is);
    Ip_f = fliplr(Ip);
  
    P = abs(Is_f-Ip_f)./(Is_f+Ip_f)*100; % Percentage
    
    for j=1:length(P)
        if abs(P(j)-15)<0.01
            max_angle(i)=grazing_angle(j);
            break
        end
    end
end

figure(5)
plot(n2, max_angle)
