function [] = WalDisEstFrom_Yplus(y_plus, dynamic_viscosity, density, v_free, L_characteristics)
% This function is used to estimate the boudary layer distance based on the y+ value
% y+ value selection guidance
% The viscous sublayer ( y+ < 5): In the viscous layer, the fluid is dominated by the viscous effect, so it can be assumed that the Reynolds shear stress is negligible. The “linear velocity law” is given by:
% The Buffer layer (5 < y+ < 30): The buffer layer is the transition region between the viscosity-dominated region and turbulence-dominated part of the flow. Viscous and turbulent stresses are of similar magnitude and since it is complex, the velocity profile is not well defined and the original wall functions avoid the first cell center located in this region.
% The logarithmic area ( y+ > 30): In the logarithmic layer, turbulence stress dominate the flow and velocity profile varies very slowly with a logarithmic function along the distance y. Formula below describes this region with the Karman constant κ of 0.41 and the constant B=5.2.



% Calculate the Reynolds number
Re_number=density*v_free*L_characteristics/dynamic_viscosity;
% Calculate the kinematic viscosity (m2/s)
kinematic_viscosity=dynamic_viscosity/density;
% Calculate skin friction coefficient (based on Schlichting skin-friction correlation)
C_f=(2*log10(Re_number)-0.65)^(-2.3);
% Calculate shear stress (Pa)
shear_stress=1/2*C_f*density*(v_free)^2;
% Calculate shear velocity (m/s)
shear_velocity=sqrt(shear_stress/density);
% Calculate boundary layer distance y (m)
y=y_plus*kinematic_viscosity/shear_velocity;


fprintf('Re_number = %f\n', Re_number)
fprintf('y = %f\n', y)

end

