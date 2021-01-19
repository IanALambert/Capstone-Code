function M=MuellerStokesMatrix(n1,n2, theta_i)
theta_r = asin((n1/n2)*sin(theta_i));

rho_p = (sin(theta_i-theta_r)/sin(theta_i+theta_r))^2;
rho_s =(tan(theta_i-theta_r)/tan(theta_i+theta_r))^2;

M = zeros(4,4);

M(1,1) = rho_s+rho_p;
M(2,2) = rho_s+rho_p;

M(1,2) = rho_p-rho_s;
M(2,1) = rho_p-rho_s;

M(3,3) = 2*sqrt(rho_p*rho_s);
M(4,4) = 2*sqrt(rho_p*rho_s);

M = M*0.5;
end