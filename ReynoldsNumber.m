function [Re] = ReynoldsNumber(flow_density,flow_speed,chara_dimension,dyna_viscosity_T)

% This function is used to calculate the Reynolds number
% flow_density (kg/m3): density of the fluid
% flow_speed (m/s): the velocity of fluid
% chara_dimension (m): the characteristics dimension (0.087m for Ford SCR)
% dyna_viscosity_T (Pa.s or kg/(m.s)): dynamic viscosity of the fluid at
% specific temperature
% kine_viscosity (m2/s): kinetic viscosity of the fluid

% WARNING: Need more accurate method of calculating Reynold number as the
% density and viscosity is not known for mixture gas flow


% dyna_viscosity_T=shear_stress/shear_rate;
Re=flow_density*flow_speed*chara_dimension/dyna_viscosity_T;

sprintf('the Reynolds number for this application is %0.5f',Re);

end

