%##Process and plot the experimental data for SCR TEST ON FORD RANGER EXHAUST SYSTEM##%

load('scr_test1_data.mat') % Load the SCR test1 dataset

%% Plots for Test1(1)(200DC_0.03KgPerS_40mgPerSUrea_20%DC_Regloplas26C_5sOnOff_20mins)(with MEXA1&2)

% (1) Exhaust flow rate (kg/s)
subplot(2,2,1)
IE1_1 = ~isnan(scr_test_1_1.Time) & ~isnan(scr_test_1_1.Exh_Flow); % make sure only non-nan index are selected
plot(scr_test_1_1.Time(IE1_1),scr_test_1_1.Exh_Flow(IE1_1)); % Raw plot of exhaust flow rate
mean_exhaust_flow=movmean(scr_test_1_1.Exh_Flow(IE1_1),50); % Avearge exhaust flow rate over adjacent 50 points
MeanExhaust_1_1=plot(scr_test_1_1.Time(IE1_1),mean_exhaust_flow,'b'); % Mean exhaust flow rate during the test 1-1
MeanExhaust_1_1.LineWidth=1
title('Exhaust gas flow rate VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas flow rate (kg/s)')
axis tight

% (2) Gas temperature before urea injector (°C)
subplot(2,2,2)
IT1_1 = ~isnan(scr_test_1_1.Time) & ~isnan(scr_test_1_1.PreSCR_T); % make sure only non-nan index are selected
PreSCRT_1_1=plot(scr_test_1_1.Time(IT1_1),scr_test_1_1.PreSCR_T(IT1_1),'r');% Raw plot of gas temperature before urea inejctor
PreSCRT_1_1.LineWidth=1
title ('Exhaust gas temperature VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas temperature before injector (°C)')
axis tight

% (3) Surface temperature after the injector (°C)
subplot(2,2,3)
IS1_1 = ~isnan(scr_test_1_1.Time) & ~isnan(scr_test_1_1.Pre_SCR_SURF_T); % make sure only non-nan index are selected
SurfT_1_1=plot(scr_test_1_1.Time(IS1_1),scr_test_1_1.Pre_SCR_SURF_T(IS1_1),'g');% Raw plot of pipe surface temperature after urea inejction
SurfT_1_1.LineWidth=1
title ('Pipe surface temperatue VS Time')
xlabel('Time (s)');
ylabel('Pipe surface temperature after injection (°C)')
axis tight

% (4) Pre (MEXA1) and post (MEXA2) SCR catalyst NOx concentration (ppm)
subplot(2,2,4)
MEXA1NOx_1_1=plot(scr_test_1_1.Time,scr_test_1_1.MEXA1NOx,'c');
MEXA1NOx_1_1.LineWidth=1
hold on
MEXA2NOx_1_1=plot(scr_test_1_1.Time,scr_test_1_1.MEXA2NOx,'m');
MEXA2NOx_1_1.LineWidth=1
legend('Pre SCR NOx','Post SCR NOx')
title ('Pre and Post SCR NOx concentration VS Time')
xlabel('Time (s)');
ylabel('NOx concentration (ppm)')
axis tight


%% Plots for Test1(2)(200DC_0.03KgPerS_150mgPerSUrea_75%DC_Regloplas26C_5sOnOff_20mins)(No MEXA)

% (1) Exhaust flow rate (kg/s)
subplot(2,2,1)
IE1_2 = ~isnan(scr_test_1_2.Time) & ~isnan(scr_test_1_2.Exh_Flow); % make sure only non-nan index are selected
plot(scr_test_1_2.Time(IE1_2),scr_test_1_2.Exh_Flow(IE1_2)); % Raw plot of exhaust flow rate
mean_exhaust_flow=movmean(scr_test_1_2.Exh_Flow(IE1_2),50); % Avearge exhaust flow rate over adjacent 50 points
MeanExhaust_1_2=plot(scr_test_1_2.Time(IE1_2),mean_exhaust_flow,'b'); % Mean exhaust flow rate during the test 1-1
MeanExhaust_1_2.LineWidth=1
title('Exhaust gas flow rate VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas flow rate (kg/s)')
axis tight
ylim([0.01 0.06])

% (2) Gas temperature before urea injector (°C)
subplot(2,2,2)
IT1_2 = ~isnan(scr_test_1_2.Time) & ~isnan(scr_test_1_2.PreSCR_T); % make sure only non-nan index are selected
PreSCRT_1_2=plot(scr_test_1_2.Time(IT1_2),scr_test_1_2.PreSCR_T(IT1_2),'r');% Raw plot of gas temperature before urea inejctor
PreSCRT_1_2.LineWidth=1
title ('Exhaust gas temperature VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas temperature before injector (°C)')
axis tight
ylim([80 290])

% (3) Surface temperature after the injector (°C)
subplot(2,2,[3,4])
IS1_2 = ~isnan(scr_test_1_2.Time) & ~isnan(scr_test_1_2.Pre_SCR_SURF_T); % make sure only non-nan index are selected
SurfT_1_2=plot(scr_test_1_2.Time(IS1_2),scr_test_1_2.Pre_SCR_SURF_T(IS1_2),'g');% Raw plot of pipe surface temperature after urea inejction
SurfT_1_2.LineWidth=1
title ('Pipe surface temperatue VS Time')
xlabel('Time (s)');
ylabel('Pipe surface temperature after injection (°C)')
axis tight
ylim([60 200])


%% Plots for Test2(1)(250DC_0.03KgPerS_150mgPerSUrea_75%DC_Regloplas80C_5sOnOff_20mins)(No MEXA)

% (1) Exhaust flow rate (kg/s)
subplot(2,2,1)
IE2_1 = ~isnan(scr_test_2_1.Time) & ~isnan(scr_test_2_1.Exh_Flow); % make sure only non-nan index are selected
plot(scr_test_2_1.Time(IE2_1),scr_test_2_1.Exh_Flow(IE2_1)); % Raw plot of exhaust flow rate
mean_exhaust_flow=movmean(scr_test_2_1.Exh_Flow(IE2_1),50); % Avearge exhaust flow rate over adjacent 50 points
MeanExhaust_2_1=plot(scr_test_2_1.Time(IE2_1),mean_exhaust_flow,'b'); % Mean exhaust flow rate during the test 1-1
MeanExhaust_2_1.LineWidth=1
title('Exhaust gas flow rate VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas flow rate (kg/s)')
axis tight
ylim([0.01 0.06])

% (2) Gas temperature before urea injector (°C)
subplot(2,2,2)
IT2_1 = ~isnan(scr_test_2_1.Time) & ~isnan(scr_test_2_1.PreSCR_T); % make sure only non-nan index are selected
PreSCRT_2_1=plot(scr_test_2_1.Time(IT2_1),scr_test_2_1.PreSCR_T(IT2_1),'r');% Raw plot of gas temperature before urea inejctor
PreSCRT_2_1.LineWidth=1
title ('Exhaust gas temperature VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas temperature before injector (°C)')
axis tight
ylim([80 290])

% (3) Surface temperature after the injector (°C)
subplot(2,2,[3,4])
IS2_1 = ~isnan(scr_test_2_1.Time) & ~isnan(scr_test_2_1.Pre_SCR_SURF_T); % make sure only non-nan index are selected
SurfT_2_1=plot(scr_test_2_1.Time(IS2_1),scr_test_2_1.Pre_SCR_SURF_T(IS2_1),'g');% Raw plot of pipe surface temperature after urea inejction
SurfT_2_1.LineWidth=1
title ('Pipe surface temperatue VS Time')
xlabel('Time (s)');
ylabel('Pipe surface temperature after injection (°C)')
axis tight
ylim([60 200])


%% Plots for Test2(2)(250DC_0.03KgPerS_200mgPerSUrea_100%DC_Regloplas80C_5sOnOff_20mins)(No MEXA)

% (1) Exhaust flow rate (kg/s)
subplot(2,2,1)
IE2_2 = ~isnan(scr_test_2_2.Time) & ~isnan(scr_test_2_2.Exh_Flow); % make sure only non-nan index are selected
plot(scr_test_2_2.Time(IE2_2),scr_test_2_2.Exh_Flow(IE2_2)); % Raw plot of exhaust flow rate
mean_exhaust_flow=movmean(scr_test_2_2.Exh_Flow(IE2_2),50); % Avearge exhaust flow rate over adjacent 50 points
MeanExhaust_2_2=plot(scr_test_2_2.Time(IE2_2),mean_exhaust_flow,'b'); % Mean exhaust flow rate during the test 1-1
MeanExhaust_2_2.LineWidth=1
title('Exhaust gas flow rate VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas flow rate (kg/s)')
axis tight
ylim([0.01 0.06])

% (2) Gas temperature before urea injector (°C)
subplot(2,2,2)
IT2_2 = ~isnan(scr_test_2_2.Time) & ~isnan(scr_test_2_2.PreSCR_T); % make sure only non-nan index are selected
PreSCRT_2_2=plot(scr_test_2_2.Time(IT2_2),scr_test_2_2.PreSCR_T(IT2_2),'r');% Raw plot of gas temperature before urea inejctor
PreSCRT_2_2.LineWidth=1
title ('Exhaust gas temperature VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas temperature before injector (°C)')
axis tight
ylim([80 290])

% (3) Surface temperature after the injector (°C)
subplot(2,2,[3,4])
IS2_2 = ~isnan(scr_test_2_2.Time) & ~isnan(scr_test_2_2.Pre_SCR_SURF_T); % make sure only non-nan index are selected
SurfT_2_2=plot(scr_test_2_2.Time(IS2_2),scr_test_2_2.Pre_SCR_SURF_T(IS2_2),'g');% Raw plot of pipe surface temperature after urea inejction
SurfT_2_2.LineWidth=1
title ('Pipe surface temperatue VS Time')
xlabel('Time (s)');
ylabel('Pipe surface temperature after injection (°C)')
axis tight
ylim([60 210])


%% Plots for Test3(1)(300DC_0.03KgPerS_200mgPerSUrea_100%DC_Regloplas80C_5sOnOff_20mins)(No MEXA)

% (1) Exhaust flow rate (kg/s)
subplot(2,2,1)
IE7_1 = ~isnan(scr_test_3_1.Time) & ~isnan(scr_test_3_1.Exh_Flow); % make sure only non-nan index are selected
plot(scr_test_3_1.Time(IE7_1),scr_test_3_1.Exh_Flow(IE7_1)); % Raw plot of exhaust flow rate
mean_exhaust_flow=movmean(scr_test_3_1.Exh_Flow(IE7_1),50); % Avearge exhaust flow rate over adjacent 50 points
MeanExhaust_3_1=plot(scr_test_3_1.Time(IE7_1),mean_exhaust_flow,'b'); % Mean exhaust flow rate during the test 1-1
MeanExhaust_3_1.LineWidth=1
title('Exhaust gas flow rate VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas flow rate (kg/s)')
axis tight


% (2) Gas temperature before urea injector (°C)
subplot(2,2,2)
IT3_2 = ~isnan(scr_test_3_1.Time) & ~isnan(scr_test_3_1.PreSCR_T); % make sure only non-nan index are selected
PreSCRT_3_1=plot(scr_test_3_1.Time(IT3_2),scr_test_3_1.PreSCR_T(IT3_2),'r');% Raw plot of gas temperature before urea inejctor
PreSCRT_3_1.LineWidth=1
title ('Exhaust gas temperature VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas temperature before injector (°C)')
axis tight


% (3) Surface temperature after the injector (°C)
subplot(2,2,[3,4])
IS3_2 = ~isnan(scr_test_3_1.Time) & ~isnan(scr_test_3_1.Pre_SCR_SURF_T); % make sure only non-nan index are selected
SurfT_3_1=plot(scr_test_3_1.Time(IS3_2),scr_test_3_1.Pre_SCR_SURF_T(IS3_2),'g');% Raw plot of pipe surface temperature after urea inejction
SurfT_3_1.LineWidth=1
title ('Pipe surface temperatue VS Time')
xlabel('Time (s)');
ylabel('Pipe surface temperature after injection (°C)')
axis tight
ylim([60 220])


%% Plots for Test3(2)(300DC_0.03KgPerS_200mgPerSUrea_100%DC_Regloplas80C_Continuous_20mins)(No MEXA)

% (1) Exhaust flow rate (kg/s)
subplot(2,2,1)
IE7_1 = ~isnan(scr_test_3_2.Time) & ~isnan(scr_test_3_2.Exh_Flow); % make sure only non-nan index are selected
plot(scr_test_3_2.Time(IE7_1),scr_test_3_2.Exh_Flow(IE7_1)); % Raw plot of exhaust flow rate
mean_exhaust_flow=movmean(scr_test_3_2.Exh_Flow(IE7_1),50); % Avearge exhaust flow rate over adjacent 50 points
MeanExhaust_3_2=plot(scr_test_3_2.Time(IE7_1),mean_exhaust_flow,'b'); % Mean exhaust flow rate during the test 1-1
MeanExhaust_3_2.LineWidth=1
title('Exhaust gas flow rate VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas flow rate (kg/s)')
axis tight


% (2) Gas temperature before urea injector (°C)
subplot(2,2,2)
IT3_2 = ~isnan(scr_test_3_2.Time) & ~isnan(scr_test_3_2.PreSCR_T); % make sure only non-nan index are selected
PreSCRT_3_2=plot(scr_test_3_2.Time(IT3_2),scr_test_3_2.PreSCR_T(IT3_2),'r');% Raw plot of gas temperature before urea inejctor
PreSCRT_3_2.LineWidth=1
title ('Exhaust gas temperature VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas temperature before injector (°C)')
axis tight


% (3) Surface temperature after the injector (°C)
subplot(2,2,[3,4])
IS3_2 = ~isnan(scr_test_3_2.Time) & ~isnan(scr_test_3_2.Pre_SCR_SURF_T); % make sure only non-nan index are selected
SurfT_3_2=plot(scr_test_3_2.Time(IS3_2),scr_test_3_2.Pre_SCR_SURF_T(IS3_2),'g');% Raw plot of pipe surface temperature after urea inejction
SurfT_3_2.LineWidth=1
title ('Pipe surface temperatue VS Time')
xlabel('Time (s)');
ylabel('Pipe surface temperature after injection (°C)')
axis tight



%% Plots for Test4(1)(200DC_0.04KgPerS_40mgPerSUrea_20%DC_Regloplas80C_5sOnOff_20mins)(No MEXA)

% (1) Exhaust flow rate (kg/s)
subplot(2,2,1)
IE7_1 = ~isnan(scr_test_4_1.Time) & ~isnan(scr_test_4_1.Exh_Flow); % make sure only non-nan index are selected
plot(scr_test_4_1.Time(IE7_1),scr_test_4_1.Exh_Flow(IE7_1)); % Raw plot of exhaust flow rate
mean_exhaust_flow=movmean(scr_test_4_1.Exh_Flow(IE7_1),50); % Avearge exhaust flow rate over adjacent 50 points
MeanExhaust_4_1=plot(scr_test_4_1.Time(IE7_1),mean_exhaust_flow,'b'); % Mean exhaust flow rate during the test 1-1
MeanExhaust_4_1.LineWidth=1
title('Exhaust gas flow rate VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas flow rate (kg/s)')
axis tight


% (2) Gas temperature before urea injector (°C)
subplot(2,2,2)
IT4_2 = ~isnan(scr_test_4_1.Time) & ~isnan(scr_test_4_1.PreSCR_T); % make sure only non-nan index are selected
PreSCRT_5_1=plot(scr_test_4_1.Time(IT4_2),scr_test_4_1.PreSCR_T(IT4_2),'r');% Raw plot of gas temperature before urea inejctor
PreSCRT_5_1.LineWidth=1
title ('Exhaust gas temperature VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas temperature before injector (°C)')
axis tight


% (3) Surface temperature after the injector (°C)
subplot(2,2,[3,4])
ISR_5 = ~isnan(scr_test_4_1.Time) & ~isnan(scr_test_4_1.Pre_SCR_SURF_T); % make sure only non-nan index are selected
SurfT_7_1=plot(scr_test_4_1.Time(ISR_5),scr_test_4_1.Pre_SCR_SURF_T(ISR_5),'g');% Raw plot of pipe surface temperature after urea inejction
SurfT_7_1.LineWidth=1
title ('Pipe surface temperatue VS Time')
xlabel('Time (s)');
ylabel('Pipe surface temperature after injection (°C)')
axis tight


%% Plots for Test4(2)(200DC_0.04KgPerS_100mgPerSUrea_50%DC_Regloplas80C_5sOnOff_20mins)(No MEXA)

% (1) Exhaust flow rate (kg/s)
subplot(2,2,1)
IE7_1 = ~isnan(scr_test_4_2.Time) & ~isnan(scr_test_4_2.Exh_Flow); % make sure only non-nan index are selected
plot(scr_test_4_2.Time(IE7_1),scr_test_4_2.Exh_Flow(IE7_1)); % Raw plot of exhaust flow rate
mean_exhaust_flow=movmean(scr_test_4_2.Exh_Flow(IE7_1),50); % Avearge exhaust flow rate over adjacent 50 points
MeanExhaust_7_1=plot(scr_test_4_2.Time(IE7_1),mean_exhaust_flow,'b'); % Mean exhaust flow rate during the test 1-1
MeanExhaust_7_1.LineWidth=1
title('Exhaust gas flow rate VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas flow rate (kg/s)')
axis tight


% (2) Gas temperature before urea injector (°C)
subplot(2,2,2)
IT4_2 = ~isnan(scr_test_4_2.Time) & ~isnan(scr_test_4_2.PreSCR_T); % make sure only non-nan index are selected
PreSCRT_5_1=plot(scr_test_4_2.Time(IT4_2),scr_test_4_2.PreSCR_T(IT4_2),'r');% Raw plot of gas temperature before urea inejctor
PreSCRT_5_1.LineWidth=1
title ('Exhaust gas temperature VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas temperature before injector (°C)')
axis tight


% (3) Surface temperature after the injector (°C)
subplot(2,2,[3,4])
ISR_5 = ~isnan(scr_test_4_2.Time) & ~isnan(scr_test_4_2.Pre_SCR_SURF_T); % make sure only non-nan index are selected
SurfT_7_1=plot(scr_test_4_2.Time(ISR_5),scr_test_4_2.Pre_SCR_SURF_T(ISR_5),'g');% Raw plot of pipe surface temperature after urea inejction
SurfT_7_1.LineWidth=1
title ('Pipe surface temperatue VS Time')
xlabel('Time (s)');
ylabel('Pipe surface temperature after injection (°C)')
axis tight


%% Plots for Test5(1)(250DC_0.04KgPerS_150mgPerSUrea_75%DC_Regloplas80C_5sOnOff_20mins)(No MEXA)

% (1) Exhaust flow rate (kg/s)
subplot(2,2,1)
IE7_1 = ~isnan(scr_test_5_1.Time) & ~isnan(scr_test_5_1.Exh_Flow); % make sure only non-nan index are selected
plot(scr_test_5_1.Time(IE7_1),scr_test_5_1.Exh_Flow(IE7_1)); % Raw plot of exhaust flow rate
mean_exhaust_flow=movmean(scr_test_5_1.Exh_Flow(IE7_1),50); % Avearge exhaust flow rate over adjacent 50 points
MeanExhaust_7_1=plot(scr_test_5_1.Time(IE7_1),mean_exhaust_flow,'b'); % Mean exhaust flow rate during the test 1-1
MeanExhaust_7_1.LineWidth=1
title('Exhaust gas flow rate VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas flow rate (kg/s)')
axis tight


% (2) Gas temperature before urea injector (°C)
subplot(2,2,2)
ITR_5 = ~isnan(scr_test_5_1.Time) & ~isnan(scr_test_5_1.PreSCR_T); % make sure only non-nan index are selected
PreSCRT_5_1=plot(scr_test_5_1.Time(ITR_5),scr_test_5_1.PreSCR_T(ITR_5),'r');% Raw plot of gas temperature before urea inejctor
PreSCRT_5_1.LineWidth=1
title ('Exhaust gas temperature VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas temperature before injector (°C)')
axis tight


% (3) Surface temperature after the injector (°C)
subplot(2,2,[3,4])
ISR_5 = ~isnan(scr_test_5_1.Time) & ~isnan(scr_test_5_1.Pre_SCR_SURF_T); % make sure only non-nan index are selected
SurfT_7_1=plot(scr_test_5_1.Time(ISR_5),scr_test_5_1.Pre_SCR_SURF_T(ISR_5),'g');% Raw plot of pipe surface temperature after urea inejction
SurfT_7_1.LineWidth=1
title ('Pipe surface temperatue VS Time')
xlabel('Time (s)');
ylabel('Pipe surface temperature after injection (°C)')
axis tight

%% Plots for Test5(2)(250DC_0.04KgPerS_200mgPerSUrea_100%DC_Regloplas80C_5sOnOff_20mins_SomeTransient)(No MEXA)

% (1) Exhaust flow rate (kg/s)
subplot(2,2,1)
IE7_1 = ~isnan(scr_test_5_2.Time) & ~isnan(scr_test_5_2.Exh_Flow); % make sure only non-nan index are selected
plot(scr_test_5_2.Time(IE7_1),scr_test_5_2.Exh_Flow(IE7_1)); % Raw plot of exhaust flow rate
mean_exhaust_flow=movmean(scr_test_5_2.Exh_Flow(IE7_1),50); % Avearge exhaust flow rate over adjacent 50 points
MeanExhaust_7_1=plot(scr_test_5_2.Time(IE7_1),mean_exhaust_flow,'b'); % Mean exhaust flow rate during the test 1-1
MeanExhaust_7_1.LineWidth=1
title('Exhaust gas flow rate VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas flow rate (kg/s)')
axis tight


% (2) Gas temperature before urea injector (°C)
subplot(2,2,2)
ITR_5 = ~isnan(scr_test_5_2.Time) & ~isnan(scr_test_5_2.PreSCR_T); % make sure only non-nan index are selected
PreSCRT_7_1=plot(scr_test_5_2.Time(ITR_5),scr_test_5_2.PreSCR_T(ITR_5),'r');% Raw plot of gas temperature before urea inejctor
PreSCRT_7_1.LineWidth=1
title ('Exhaust gas temperature VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas temperature before injector (°C)')
axis tight


% (3) Surface temperature after the injector (°C)
subplot(2,2,[3,4])
ISR_5 = ~isnan(scr_test_5_2.Time) & ~isnan(scr_test_5_2.Pre_SCR_SURF_T); % make sure only non-nan index are selected
SurfT_7_1=plot(scr_test_5_2.Time(ISR_5),scr_test_5_2.Pre_SCR_SURF_T(ISR_5),'g');% Raw plot of pipe surface temperature after urea inejction
SurfT_7_1.LineWidth=1
title ('Pipe surface temperatue VS Time')
xlabel('Time (s)');
ylabel('Pipe surface temperature after injection (°C)')
axis tight


%% Plots for Test6(1)(300DC_0.04KgPerS_40mgPerSUrea_20%DC_Regloplas80C_Continuous_20mins)(No MEXA)

% (1) Exhaust flow rate (kg/s)
subplot(2,2,1)
IE7_1 = ~isnan(scr_test_6_1.Time) & ~isnan(scr_test_6_1.Exh_Flow)& (scr_test_6_1.Exh_Flow>0); % make sure only non-nan index are selected
plot(scr_test_6_1.Time(IE7_1),scr_test_6_1.Exh_Flow(IE7_1)); % Raw plot of exhaust flow rate
mean_exhaust_flow=movmean(scr_test_6_1.Exh_Flow(IE7_1),50); % Avearge exhaust flow rate over adjacent 50 points
MeanExhaust_7_1=plot(scr_test_6_1.Time(IE7_1),mean_exhaust_flow,'b'); % Mean exhaust flow rate during the test 1-1
MeanExhaust_7_1.LineWidth=1
title('Exhaust gas flow rate VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas flow rate (kg/s)')
axis tight


% (2) Gas temperature before urea injector (°C)
subplot(2,2,2)
ITR_5 = ~isnan(scr_test_6_1.Time) & ~isnan(scr_test_6_1.PreSCR_T); % make sure only non-nan index are selected
PreSCRT_7_1=plot(scr_test_6_1.Time(ITR_5),scr_test_6_1.PreSCR_T(ITR_5),'r');% Raw plot of gas temperature before urea inejctor
PreSCRT_7_1.LineWidth=1
title ('Exhaust gas temperature VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas temperature before injector (°C)')
axis tight


% (3) Surface temperature after the injector (°C)
subplot(2,2,[3,4])
ISR_5 = ~isnan(scr_test_6_1.Time) & ~isnan(scr_test_6_1.Pre_SCR_SURF_T); % make sure only non-nan index are selected
SurfT_7_1=plot(scr_test_6_1.Time(ISR_5),scr_test_6_1.Pre_SCR_SURF_T(ISR_5),'g');% Raw plot of pipe surface temperature after urea inejction
SurfT_7_1.LineWidth=1
title ('Pipe surface temperatue VS Time')
xlabel('Time (s)');
ylabel('Pipe surface temperature after injection (°C)')
axis tight


%% Plots for Test6(2)(300DC_0.04KgPerS_100mgPerSUrea_50%DC_Regloplas80C_Continuous_20mins)(No MEXA)

% (1) Exhaust flow rate (kg/s)
subplot(2,2,1)
IE7_1 = ~isnan(scr_test_6_2.Time) & ~isnan(scr_test_6_2.Exh_Flow)& (scr_test_6_2.Exh_Flow>0); % make sure only non-nan index are selected
plot(scr_test_6_2.Time(IE7_1),scr_test_6_2.Exh_Flow(IE7_1)); % Raw plot of exhaust flow rate
mean_exhaust_flow=movmean(scr_test_6_2.Exh_Flow(IE7_1),50); % Avearge exhaust flow rate over adjacent 50 points
MeanExhaust_7_1=plot(scr_test_6_2.Time(IE7_1),mean_exhaust_flow,'b'); % Mean exhaust flow rate during the test 1-1
MeanExhaust_7_1.LineWidth=1
title('Exhaust gas flow rate VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas flow rate (kg/s)')
axis tight


% (2) Gas temperature before urea injector (°C)
subplot(2,2,2)
ITR_5= ~isnan(scr_test_6_2.Time) & ~isnan(scr_test_6_2.PreSCR_T); % make sure only non-nan index are selected
PreSCRT_7_1=plot(scr_test_6_2.Time(ITR_5),scr_test_6_2.PreSCR_T(ITR_5),'r');% Raw plot of gas temperature before urea inejctor
PreSCRT_7_1.LineWidth=1
title ('Exhaust gas temperature VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas temperature before injector (°C)')
axis tight


% (3) Surface temperature after the injector (°C)
subplot(2,2,[3,4])
ISR_5 = ~isnan(scr_test_6_2.Time) & ~isnan(scr_test_6_2.Pre_SCR_SURF_T); % make sure only non-nan index are selected
SurfT_7_1=plot(scr_test_6_2.Time(ISR_5),scr_test_6_2.Pre_SCR_SURF_T(ISR_5),'g');% Raw plot of pipe surface temperature after urea inejction
SurfT_7_1.LineWidth=1
title ('Pipe surface temperatue VS Time')
xlabel('Time (s)');
ylabel('Pipe surface temperature after injection (°C)')
axis tight


%% Plots for Test7(1)(350DC_0.04KgPerS_40mgPerSUrea_20%DC_Regloplas80C_Continuous_20mins)(No MEXA)

% (1) Exhaust flow rate (kg/s)
subplot(2,2,1)
IE7_1 = ~isnan(scr_test_7_1.Time) & ~isnan(scr_test_7_1.Exh_Flow)& (scr_test_7_1.Exh_Flow>0); % make sure only non-nan index are selected
plot(scr_test_7_1.Time(IE7_1),scr_test_7_1.Exh_Flow(IE7_1)); % Raw plot of exhaust flow rate
mean_exhaust_flow=movmean(scr_test_7_1.Exh_Flow(IE7_1),50); % Avearge exhaust flow rate over adjacent 50 points
MeanExhaust_7_1=plot(scr_test_7_1.Time(IE7_1),mean_exhaust_flow,'b'); % Mean exhaust flow rate during the test 1-1
MeanExhaust_7_1.LineWidth=1
title('Exhaust gas flow rate VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas flow rate (kg/s)')
axis tight


% (2) Gas temperature before urea injector (°C)
subplot(2,2,2)
ITR_5= ~isnan(scr_test_7_1.Time) & ~isnan(scr_test_7_1.PreSCR_T); % make sure only non-nan index are selected
PreSCRT_7_1=plot(scr_test_7_1.Time(ITR_5),scr_test_7_1.PreSCR_T(ITR_5),'r');% Raw plot of gas temperature before urea inejctor
PreSCRT_7_1.LineWidth=1
title ('Exhaust gas temperature VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas temperature before injector (°C)')
axis tight


% (3) Surface temperature after the injector (°C)
subplot(2,2,[3,4])
ISR_5 = ~isnan(scr_test_7_1.Time) & ~isnan(scr_test_7_1.Pre_SCR_SURF_T); % make sure only non-nan index are selected
SurfT_7_1=plot(scr_test_7_1.Time(ISR_5),scr_test_7_1.Pre_SCR_SURF_T(ISR_5),'g');% Raw plot of pipe surface temperature after urea inejction
SurfT_7_1.LineWidth=1
title ('Pipe surface temperatue VS Time')
xlabel('Time (s)');
ylabel('Pipe surface temperature after injection (°C)')
axis tight

%% Plots for regeneration (1)---Some errors for regeneration

% (1) Exhaust flow rate (kg/s)
subplot(2,2,1)
IER_5 = ~isnan(Regen_1.Time) & ~isnan(Regen_1.Exh_Flow)& (Regen_1.Exh_Flow>=0); % make sure only non-nan index are selected
plot(Regen_1.Time(IER_5),Regen_1.Exh_Flow(IER_5)); % Raw plot of exhaust flow rate
mean_exhaust_flow=movmean(Regen_1.Exh_Flow(IER_5),50); % Avearge exhaust flow rate over adjacent 50 points
MeanExhaust_Re_1=plot(Regen_1.Time(IER_5),mean_exhaust_flow,'b'); % Mean exhaust flow rate during the test 1-1
MeanExhaust_Re_1.LineWidth=1
title('Exhaust gas flow rate VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas flow rate (kg/s)')
axis tight


% (2) Gas temperature before urea injector (°C)
subplot(2,2,2)
ITR_5= ~isnan(Regen_1.Time) & ~isnan(Regen_1.PreSCR_T); % make sure only non-nan index are selected
PreSCRT_Re_5=plot(Regen_1.Time(ITR_5),Regen_1.PreSCR_T(ITR_5),'r');% Raw plot of gas temperature before urea inejctor
PreSCRT_Re_5.LineWidth=1
title ('Exhaust gas temperature VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas temperature before injector (°C)')
axis tight


% (3) Surface temperature after the injector (°C)
subplot(2,2,[3,4])
ISR_5 = ~isnan(Regen_1.Time) & ~isnan(Regen_1.Pre_SCR_SURF_T); % make sure only non-nan index are selected
SurfT_Re_1=plot(Regen_1.Time(ISR_5),Regen_1.Pre_SCR_SURF_T(ISR_5),'g');% Raw plot of pipe surface temperature after urea inejction
SurfT_Re_1.LineWidth=1
title ('Pipe surface temperatue VS Time')
xlabel('Time (s)');
ylabel('Pipe surface temperature after injection (°C)')
axis tight

%% Plots for regeneration (2)

% (1) Exhaust flow rate (kg/s)
subplot(2,2,1)
IER_5 = ~isnan(Regen_2.Time) & ~isnan(Regen_2.Exh_Flow)& (Regen_2.Exh_Flow>=0); % make sure only non-nan index are selected
plot(Regen_2.Time(IER_5),Regen_2.Exh_Flow(IER_5)); % Raw plot of exhaust flow rate
mean_exhaust_flow=movmean(Regen_2.Exh_Flow(IER_5),50); % Avearge exhaust flow rate over adjacent 50 points
MeanExhaust_Re_5=plot(Regen_2.Time(IER_5),mean_exhaust_flow,'b'); % Mean exhaust flow rate during the test 1-1
MeanExhaust_Re_5.LineWidth=1
title('Exhaust gas flow rate VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas flow rate (kg/s)')
axis tight


% (2) Gas temperature before urea injector (°C)
subplot(2,2,2)
ITR_5= ~isnan(Regen_2.Time) & ~isnan(Regen_2.PreSCR_T); % make sure only non-nan index are selected
PreSCRT_Re_5=plot(Regen_2.Time(ITR_5),Regen_2.PreSCR_T(ITR_5),'r');% Raw plot of gas temperature before urea inejctor
PreSCRT_Re_5.LineWidth=1
title ('Exhaust gas temperature VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas temperature before injector (°C)')
axis tight


% (3) Surface temperature after the injector (°C)
subplot(2,2,[3,4])
ISR_5 = ~isnan(Regen_2.Time) & ~isnan(Regen_2.Pre_SCR_SURF_T); % make sure only non-nan index are selected
SurfT_Re_5=plot(Regen_2.Time(ISR_5),Regen_2.Pre_SCR_SURF_T(ISR_5),'g');% Raw plot of pipe surface temperature after urea inejction
SurfT_Re_5.LineWidth=1
title ('Pipe surface temperatue VS Time')
xlabel('Time (s)');
ylabel('Pipe surface temperature after injection (°C)')
axis tight


%% Plots for regeneration (3)

% (1) Exhaust flow rate (kg/s)
subplot(2,2,1)
IER_5 = ~isnan(Regen_3.Time) & ~isnan(Regen_3.Exh_Flow)& (Regen_3.Exh_Flow>=0); % make sure only non-nan index are selected
plot(Regen_3.Time(IER_5),Regen_3.Exh_Flow(IER_5)); % Raw plot of exhaust flow rate
mean_exhaust_flow=movmean(Regen_3.Exh_Flow(IER_5),50); % Avearge exhaust flow rate over adjacent 50 points
MeanExhaust_Re_5=plot(Regen_3.Time(IER_5),mean_exhaust_flow,'b'); % Mean exhaust flow rate during the test 1-1
MeanExhaust_Re_5.LineWidth=1
title('Exhaust gas flow rate VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas flow rate (kg/s)')
axis tight


% (2) Gas temperature before urea injector (°C)
subplot(2,2,2)
ITR_5= ~isnan(Regen_3.Time) & ~isnan(Regen_3.PreSCR_T); % make sure only non-nan index are selected
PreSCRT_Re_5=plot(Regen_3.Time(ITR_5),Regen_3.PreSCR_T(ITR_5),'r');% Raw plot of gas temperature before urea inejctor
PreSCRT_Re_5.LineWidth=1
title ('Exhaust gas temperature VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas temperature before injector (°C)')
axis tight


% (3) Surface temperature after the injector (°C)
subplot(2,2,[3,4])
ISR_5 = ~isnan(Regen_3.Time) & ~isnan(Regen_3.Pre_SCR_SURF_T); % make sure only non-nan index are selected
SurfT_Re_5=plot(Regen_3.Time(ISR_5),Regen_3.Pre_SCR_SURF_T(ISR_5),'g');% Raw plot of pipe surface temperature after urea inejction
SurfT_Re_5.LineWidth=1
title ('Pipe surface temperatue VS Time')
xlabel('Time (s)');
ylabel('Pipe surface temperature after injection (°C)')
axis tight


%% Plots for regeneration (4)

% (1) Exhaust flow rate (kg/s)
subplot(2,2,1)
IER_5 = ~isnan(Regen_4.Time) & ~isnan(Regen_4.Exh_Flow)& (Regen_4.Exh_Flow>=0); % make sure only non-nan index are selected
plot(Regen_4.Time(IER_5),Regen_4.Exh_Flow(IER_5)); % Raw plot of exhaust flow rate
mean_exhaust_flow=movmean(Regen_4.Exh_Flow(IER_5),50); % Avearge exhaust flow rate over adjacent 50 points
MeanExhaust_Re_5=plot(Regen_4.Time(IER_5),mean_exhaust_flow,'b'); % Mean exhaust flow rate during the test 1-1
MeanExhaust_Re_5.LineWidth=1
title('Exhaust gas flow rate VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas flow rate (kg/s)')
axis tight


% (2) Gas temperature before urea injector (°C)
subplot(2,2,2)
ITR_5= ~isnan(Regen_4.Time) & ~isnan(Regen_4.PreSCR_T); % make sure only non-nan index are selected
PreSCRT_Re_5=plot(Regen_4.Time(ITR_5),Regen_4.PreSCR_T(ITR_5),'r');% Raw plot of gas temperature before urea inejctor
PreSCRT_Re_5.LineWidth=1
title ('Exhaust gas temperature VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas temperature before injector (°C)')
axis tight


% (3) Surface temperature after the injector (°C)
subplot(2,2,[3,4])
ISR_5 = ~isnan(Regen_4.Time) & ~isnan(Regen_4.Pre_SCR_SURF_T); % make sure only non-nan index are selected
SurfT_Re_5=plot(Regen_4.Time(ISR_5),Regen_4.Pre_SCR_SURF_T(ISR_5),'g');% Raw plot of pipe surface temperature after urea inejction
SurfT_Re_5.LineWidth=1
title ('Pipe surface temperatue VS Time')
xlabel('Time (s)');
ylabel('Pipe surface temperature after injection (°C)')
axis tight


%% Plots for regeneration (5)

% (1) Exhaust flow rate (kg/s)
subplot(2,2,1)
IER_5 = ~isnan(Regen_5.Time) & ~isnan(Regen_5.Exh_Flow)& (Regen_5.Exh_Flow>=0); % make sure only non-nan index are selected
plot(Regen_5.Time(IER_5),Regen_5.Exh_Flow(IER_5)); % Raw plot of exhaust flow rate
mean_exhaust_flow=movmean(Regen_5.Exh_Flow(IER_5),50); % Avearge exhaust flow rate over adjacent 50 points
MeanExhaust_Re_5=plot(Regen_5.Time(IER_5),mean_exhaust_flow,'b'); % Mean exhaust flow rate during the test 1-1
MeanExhaust_Re_5.LineWidth=1
title('Exhaust gas flow rate VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas flow rate (kg/s)')
axis tight


% (2) Gas temperature before urea injector (°C)
subplot(2,2,2)
ITR_5= ~isnan(Regen_5.Time) & ~isnan(Regen_5.PreSCR_T); % make sure only non-nan index are selected
PreSCRT_Re_5=plot(Regen_5.Time(ITR_5),Regen_5.PreSCR_T(ITR_5),'r');% Raw plot of gas temperature before urea inejctor
PreSCRT_Re_5.LineWidth=1
title ('Exhaust gas temperature VS Time')
xlabel('Time (s)');
ylabel('Exhaust gas temperature before injector (°C)')
axis tight


% (3) Surface temperature after the injector (°C)
subplot(2,2,[3,4])
ISR_5 = ~isnan(Regen_5.Time) & ~isnan(Regen_5.Pre_SCR_SURF_T); % make sure only non-nan index are selected
SurfT_Re_5=plot(Regen_5.Time(ISR_5),Regen_5.Pre_SCR_SURF_T(ISR_5),'g');% Raw plot of pipe surface temperature after urea inejction
SurfT_Re_5.LineWidth=1
title ('Pipe surface temperatue VS Time')
xlabel('Time (s)');
ylabel('Pipe surface temperature after injection (°C)')
axis tight



%% Local Functions

function []=scr_plot(x,y)
    plot(x,y)
end