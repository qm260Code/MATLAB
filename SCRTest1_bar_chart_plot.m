%% This script is used to plot the bar chart for SCR CFD validation for test1

% Define the X axis
X = categorical({'OP1','OP2','OP3'}); % Define X as categorical array,
X = reordercats(X,{'OP1','OP2','OP3'}); % call the reordercats function to specify the order for the bars

% Define the Y axis
y_gas_T = [473 465; 523 516; 573 560]; % SS exhaust gas temperature (1st column: experiment; 2nd column: simulation)
y_gas_T_error=[20 10;20 10;20 10];
y_surf_TBI = [418 431; 473 468 ; 498 504]; % SS surface temperature before injection (1st column: experiment; 2nd column: simulation)
y_surf_TBI_error=[40 20;40 20;40 20];
y_surf_TAI = [338 356; 346 368; 349 370]; % SS surface temperature during injection (1st column: experiment; 2nd column: simulation)
y_surf_TAI_error=[40 20;40 20;40 20];
y_surf_DROP = [80 75; 127 100; 149 134]; % SS surface temperature drop (1st column: experiment; 2nd column: simulation)
y_surf_DROP_error=[]


%% Bar plot for exhaust gas temperature
figure
b = bar(X,y_gas_T,'FaceColor','flat');
for k = 1:size(y_gas_T,2)
    b(k).CData = k;
end
xlabel('Operating condition','FontSize',20)
ylabel('Exhaust gas temperature (K)','FontSize',20)
legend('Experiment','Simulation','Location','northwest','FontSize',16,'TextColor','blue')
%% Bar plot for exhaust gas temperature (with error bar)
b = bar(y_gas_T, 'grouped');
hold on
% Get the x coordinate of the bars
[ngroups,nbars] = size(y_gas_T)
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
% Plot the errorbars
errorbar(x',y_gas_T,y_gas_T_error,'k','linestyle','none','CapSize',20,'Marker','none');
hold off
xlabel('Operating condition','FontSize',20)
ylabel('Exhaust gas temperature (K)','FontSize',20)
legend('Experiment','Simulation','Location','northwest','FontSize',16,'TextColor','blue')
%% Bar plot for surface temperature before injection
figure
c = bar(X,y_surf_TBI,'FaceColor','flat');
for k = 1:size(y_surf_TBI,2)
    c(k).CData = k;
end
xlabel('Operating condition','FontSize',20)
ylabel('Surface temperature before injection (K)','FontSize',20)
legend('Experiment','Simulation','Location','northwest','FontSize',16,'TextColor','blue')
%% Bar plot for surface temperature before injection (with error bar)
b = bar(y_surf_TBI, 'grouped');
hold on
% Get the x coordinate of the bars
[ngroups,nbars] = size(y_surf_TBI)
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
% Plot the errorbars
errorbar(x',y_surf_TBI,y_surf_TBI_error,'k','linestyle','none','CapSize',20,'Marker','none');
hold off
xlabel('Operating condition','FontSize',20)
ylabel('Surface temperature before injection (K)','FontSize',20)
legend('Experiment','Simulation','Location','northwest','FontSize',16,'TextColor','blue')
%% Bar plot for surface temperature during injection
figure
d = bar(X,y_surf_TAI,'FaceColor','flat');
for k = 1:size(y_surf_TAI,2)
    d(k).CData = k;
end
xlabel('Operating condition','FontSize',20)
ylabel('Surface temperature during injection (K)','FontSize',20)
legend('Experiment','Simulation','Location','northwest','FontSize',16,'TextColor','blue')
%% Bar plot for surface temperature during injection (with error bar)
b = bar(y_surf_TAI, 'grouped');
hold on
% Get the x coordinate of the bars
[ngroups,nbars] = size(y_surf_TAI)
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
% Plot the errorbars
errorbar(x',y_surf_TAI,y_surf_TAI_error,'k','linestyle','none','CapSize',20,'Marker','none');
hold off
xlabel('Operating condition','FontSize',20)
ylabel('Surface temperature during injection (K)','FontSize',20)
legend('Experiment','Simulation','Location','northwest','FontSize',16,'TextColor','blue')
%% Bar plot for surface temperature drop
figure
e = bar(X,y_surf_DROP,'FaceColor','flat');
for k = 1:size(y_surf_DROP,2)
    e(k).CData = k;
end
xlabel('Operating condition','FontSize',20)
ylabel('Surface temperature drop (K)','FontSize',20)
legend('Experiment','Simulation','Location','northwest','FontSize',16,'TextColor','blue')
%% Bar plot for surface temperature drop (with error bar)
