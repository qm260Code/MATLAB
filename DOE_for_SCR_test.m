%% DOE design for SCR test matrix (Experimental and Simulation)

% This scripts is used for generating DOE plan for test rig simulation and experimental test




%% Define the controllable and uncontrollable variables
% Controllable variables

T_exhaust_high=723;
T_exhaust_low=473;
T_exhaust=linspace(T_exhaust_low,T_exhaust_high,5); % Exhaust gas temperature (Degree C)

MF_exhaust_high=0.07;
MF_exhaust_low=0.02;
MF_exhaust=linspace(MF_exhaust_low,MF_exhaust_high,5); % Exhaust mass flow rate (kg/s)

T_mixer_high=723;
T_mixer_low=373;
T_mixer=linspace(T_mixer_low,T_mixer_high,5); % Mixer wall temperature (Degree C) ---Leidenfrost temperature: 

T_bound_wall_high=673;
T_bound_wall_low=373;
T_bound_wall= linspace(T_bound_wall_low,T_bound_wall_high,5); % Boundary wall temperature (Degree C) 

UWS_dosing_rate_high=200;
UWS_dosing_rate_low=50;
UWS_dosing_rate= linspace(UWS_dosing_rate_low,UWS_dosing_rate_high,5); % UWS dosing rate (mg/s)


labels = {'T_{exhaust}(K)' 'MF_{exhaust}(kg/s)' 'T_{wall}(K)' 'Dosing rate(mg/s)'};
% Uncontrollable variables


%% Full Factorial Design
% Full factorial input information
prompts = {'Number of levels (T_exhaust)', 'Number of levels (MF_exhaust)', 'Number of levels (T_wall)','Number of levels (UWS_dosing_rate)'};
defaults = {'2','2','2','2'};
answer = inputdlg(prompts, 'Full factorial design (SCR deposit)', 1, defaults);
N_T_exhaust=str2num(answer{1}); % the number of levels for exhaust gas temperature
N_MF_exhaust=str2num(answer{2}); % the number of levels for exhaust gas mass flow rate
NF_T_mixer=str2num(answer{3}); % the number of levels for solid wall temperature
N_UWS_dosing_rate=str2num(answer{4}); % the number of levels for UWS dosing rate
FFD = fullfact([N_T_exhaust N_T_exhaust NF_T_mixer N_UWS_dosing_rate]);
FFD_bounds=[T_exhaust_low T_exhaust_high;MF_exhaust_low MF_exhaust_high;T_mixer_low T_mixer_high;UWS_dosing_rate_low UWS_dosing_rate_high];
FFD_RealValue= zeros(size(FFD)); % Create the empty matrix with the same dimension as the FFD matrix
for i = 1:size(FFD,2) % from the first column to the end column
    FFD_zmax = max(FFD(:,i)); % max coded value of each column (variable)
    FFD_zmin = min(FFD(:,i)); % min coded value of each column (variable)
    FFD_RealValue(:,i) = interp1([FFD_zmin FFD_zmax],FFD_bounds(i,:),FFD(:,i)); % interpolate
end

% Plot (1): Plotmatrix 
figure 
[FFD_h,FFD_ax] = plotmatrix(FFD_RealValue); % create a size(BBD,1) x 4 matrix of plots
for i = 1:size(FFD,2) % label the plots
  xlabel(FFD_ax(4,i), labels{i})
  ylabel(FFD_ax(i,1), labels{i})
end
% Plot (2): 4D scatter plot
figure 
FFD_scatter=scatter3(FFD_RealValue(:,1),FFD_RealValue(:,2),FFD_RealValue(:,3),40,FFD_RealValue(:,4),'filled','MarkerEdgeColor','k') % draw the scatter plot
FDD_ax = gca;
view(-31,14)
xlabel('T_{exhaust}(K)')
ylabel('MF_{exhaust}(kg/s)')
zlabel('T_{wall}(K)')
FFD_cb = colorbar; % create and label the colorbar
FFD_cb.Label.String = 'UWS dosing rate (mg/s)';

%% Fractional Factorial Designs
generators = fracfactgen('A B C D',3,4) % uses the Franklin-Bailey algorithm to find generators for the smallest two-level fractional-factorial design for estimating linear model terms specified by terms
[FraFD,confounding] = fracfact(generators)
FraFD_bounds=[T_exhaust_low T_exhaust_high;MF_exhaust_low MF_exhaust_high;T_mixer_low T_mixer_high;UWS_dosing_rate_low UWS_dosing_rate_high];
FraFD_RealValue= zeros(size(FraFD)); % Create the empty matrix with the same dimension as the FFD matrix
for i = 1:size(FraFD,2) % from the first column to the end column
    FraFD_zmax = max(FraFD(:,i)); % max coded value of each column (variable)
    FraFD_zmin = min(FraFD(:,i)); % min coded value of each column (variable)
    FraFD_RealValue(:,i) = interp1([FraFD_zmin FraFD_zmax],FraFD_bounds(i,:),FraFD(:,i)); % interpolate
end

% Plot (1): Plotmatrix 
figure 
[FraFD_h,FraFD_ax] = plotmatrix(FraFD_RealValue); % create a size(BBD,1) x 4 matrix of plots
for i = 1:size(FraFD,2) % label the plots
  xlabel(FraFD_ax(4,i), labels{i})
  ylabel(FraFD_ax(i,1), labels{i})
end
% Plot (2): 4D scatter plot
figure 
FraFD_scatter=scatter3(FraFD_RealValue(:,1),FraFD_RealValue(:,2),FraFD_RealValue(:,3),40,FraFD_RealValue(:,4),'filled','MarkerEdgeColor','k') % draw the scatter plot
FraFD_ax = gca;
view(-31,14)
xlabel('T_{exhaust}(K)')
ylabel('MF_{exhaust}(kg/s)')
zlabel('T_{wall}(K)')
FFD_cb = colorbar; % create and label the colorbar
FFD_cb.Label.String = 'UWS dosing rate (mg/s)';
%% Box-Behnken design (Response surface design)
[BBD column_BBD] = bbdesign(4); % 4 factors for the design
BBD_bounds=[T_exhaust_low T_exhaust_high;MF_exhaust_low MF_exhaust_high;T_mixer_low T_mixer_high;UWS_dosing_rate_low UWS_dosing_rate_high];
BD_RealValue= zeros(size(BBD)); % Create the empty matrix with the same dimension as the FFD matrix
for i = 1:size(BBD,2) % from the first column to the end column
    BBD_zmax = max(BBD(:,i)); % max coded value of each column (variable)
    BBD_zmin = min(BBD(:,i)); % min coded value of each column (variable)
    BBD_RealValue(:,i) = interp1([BBD_zmin BBD_zmax],BBD_bounds(i,:),BBD(:,i)); % interpolate
end
% Plot (1)
figure
[BBD_h,BBD_ax] = plotmatrix(BBD_RealValue); % create a size(BBD,1) x 4 matrix of plots
for i = 1:size(BBD,2) % label the plots
  xlabel(BBD_ax(4,i), labels{i})
  ylabel(BBD_ax(i,1), labels{i})
end

% Plot (2): 4D scatter plot
figure 
BBD_scatter=scatter3(BBD_RealValue(:,1),BBD_RealValue(:,2),BBD_RealValue(:,3),40,BBD_RealValue(:,4),'filled','MarkerEdgeColor','k') % draw the scatter plot
BBD_ax = gca;
view(-31,14)
xlabel('T_{exhaust}(K)')
ylabel('MF_{exhaust}(kg/s)')
zlabel('T_{wall}(K)')
BBD_cb = colorbar; % create and label the colorbar
BBD_cb.Label.String = 'UWS dosing rate (mg/s)';


%% Central composite design (Response surface design)
dCC_bounds=[T_exhaust_low T_exhaust_high;MF_exhaust_low MF_exhaust_high;T_mixer_low T_mixer_high;UWS_dosing_rate_low UWS_dosing_rate_high];
% Faced type design
[dCC_face,blocks_faced] = ccdesign(4,'type','faced')
dCC_face_RealValue= zeros(size(dCC_face));% Create the empty matrix with the same dimension as the FFD matrix
for i = 1:size(dCC_face_RealValue,2) % from the first column to the end column
    dCC_face_zmax = max(dCC_face(:,i)); % max coded value of each column (variable)
    dCC_face_zmin = min(dCC_face(:,i)); % min coded value of each column (variable)
    dCC_face_RealValue(:,i) = interp1([dCC_face_zmin dCC_face_zmax],dCC_bounds(i,:),dCC_face(:,i)); % interpolate
end
% Plot (1)
figure
[dCC_face_h,dCC_face_ax] = plotmatrix(dCC_face_RealValue); % create a size(BBD,1) x 4 matrix of plots
for i = 1:size(dCC_face,2) % label the plots
  xlabel(dCC_face_ax(4,i), labels{i})
  ylabel(dCC_face_ax(i,1), labels{i})
end
% Plot (2): 4D scatter plot
figure 
dCC_face_scatter=scatter3(dCC_face_RealValue(:,1),dCC_face_RealValue(:,2),dCC_face_RealValue(:,3),40,dCC_face_RealValue(:,4),'filled','MarkerEdgeColor','k') % draw the scatter plot
dCC_face_ax = gca;
view(-31,14)
xlabel('T_{exhaust}(K)')
ylabel('MF_{exhaust}(kg/s)')
zlabel('T_{wall}(K)')
dCC_face_cb = colorbar; % create and label the colorbar
dCC_face_cb.Label.String = 'UWS dosing rate (mg/s)';



% Circumscribed type design
[dCC_circumscribed,blocks_circumscribed] = ccdesign(4,'type','circumscribed')
dCC_circumscribed_RealValue= zeros(size(dCC_circumscribed));
for i = 1:size(dCC_circumscribed_RealValue,2) % from the first column to the end column
    dCC_circumscribed_zmax = max(dCC_circumscribed(:,i)); % max coded value of each column (variable)
    dCC_circumscribed_zmin = min(dCC_circumscribed(:,i)); % min coded value of each column (variable)
    dCC_circumscribed_RealValue(:,i) = interp1([dCC_circumscribed_zmin dCC_circumscribed_zmax],dCC_bounds(i,:),dCC_circumscribed(:,i)); % interpolate
end
% Plot (1)
figure
[dCC_circumscribed_h,dCC_circumscribed_ax] = plotmatrix(dCC_circumscribed_RealValue); % create a size(BBD,1) x 4 matrix of plots
for i = 1:size(dCC_circumscribed,2) % label the plots
  xlabel(dCC_circumscribed_ax(4,i), labels{i})
  ylabel(dCC_circumscribed_ax(i,1), labels{i})
end
% Plot (2): 4D scatter plot
figure 
dCC_circumscribed_scatter=scatter3(dCC_circumscribed_RealValue(:,1),dCC_circumscribed_RealValue(:,2),dCC_circumscribed_RealValue(:,3),40,dCC_circumscribed_RealValue(:,4),'filled','MarkerEdgeColor','k') % draw the scatter plot
dCC_circumscribed_ax = gca;
view(-31,14)
xlabel('T_{exhaust}(K)')
ylabel('MF_{exhaust}(kg/s)')
zlabel('T_{wall}(K)')
dCC_circumscribed_cb = colorbar; % create and label the colorbar
dCC_circumscribed_cb.Label.String = 'UWS dosing rate (mg/s)';



% Inscribed type design
[dCC_inscribed,blocks_inscribed] = ccdesign(4,'type','inscribed')
dCC_inscribed_RealValue= zeros(size(dCC_inscribed));
for i = 1:size(dCC_face_RealValue,2) % from the first column to the end column
    dCC_inscribed_zmax = max(dCC_inscribed(:,i)); % max coded value of each column (variable)
    dCC_inscribed_zmin = min(dCC_inscribed(:,i)); % min coded value of each column (variable)
    dCC_inscribed_RealValue(:,i) = interp1([dCC_inscribed_zmin  dCC_inscribed_zmax],dCC_bounds(i,:), dCC_inscribed(:,i)); % interpolate
end
% Plot (1)
figure
[dCC_inscribed_h,dCC_inscribed_ax] = plotmatrix(dCC_inscribed_RealValue); % create a size(BBD,1) x 4 matrix of plots
for i = 1:size(dCC_inscribed,2) % label the plots
  xlabel(dCC_inscribed_ax(4,i), labels{i})
  ylabel(dCC_inscribed_ax(i,1), labels{i})
end
% Plot (2): 4D scatter plot
figure 
dCC_inscribed_scatter=scatter3(dCC_inscribed_RealValue(:,1),dCC_inscribed_RealValue(:,2),dCC_inscribed_RealValue(:,3),40,dCC_inscribed_RealValue(:,4),'filled','MarkerEdgeColor','k') % draw the scatter plot
dCC_inscribed_ax = gca;
view(-31,14)
xlabel('T_{exhaust}(K)')
ylabel('MF_{exhaust}(kg/s)')
zlabel('T_{wall}(K)')
dCC_inscribed_cb = colorbar; % create and label the colorbar
dCC_inscribed_cb.Label.String = 'UWS dosing rate (mg/s)';
%% D-optimal design




