n1 = 1; % index of refraction of a vacuum
numR = 4; % Number of reflections


n_idx = 1.1:0.01:2.0;
len = length(n_idx);
angles = zeros(1,len);
for i=1:len
    n2 = n_idx(i); % index of refraction of the coumpound of interest
    [theta_1, theta_2, P] = DegreeOfPolarization(n1, n2, numR);
    n = length(P);
    i
    for j=1:n
        if abs(P(j)-0.05)<0.0001
            angles(i) = theta_1(j)*180/pi;
            break
        end
    end
    
    
end


figure(2)
plot(n_idx, angles)
title('Maximum Angle with respect to Index of Refraction')
xlabel('Index of Refraction')
ylabel('Maximum Angle (degrees)')
