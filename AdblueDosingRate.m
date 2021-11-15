% This is used for estimate the adblue dosing rate in the SCR system based on NOx
% concentration in the exhaust flow rate
function [m_AdBlue] = AdblueDosingRate(T_exh,M_exh,NOx_ppm,ANR)
% Estimate the AdBlue dosing rate (M_AdBlue:mg/s) based on exhaust mass 
% flow rate (M_exh:Kg/h) and NO concentration (NOx_ppm:ppm) and 
% ammonia-to-NOx mole ratio (ANR)
% Urea molecular weight: 60g/mol
% NO molecular weight: 28.9g/mol
if T_exh>=200
    m_AdBlue=(M_exh.*NOx_ppm*ANR*60)/(3600*28.9*2*0.325);
else 
    m_AdBlue=0;
end
    
end

