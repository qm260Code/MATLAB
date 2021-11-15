function [] = SCR_dosing_pulse_generation(pulse_type,p_frequency,g_frequency,duty_cycle,start_time,end_time)
% This is for generating specific PWM signal (e.g. frequency, duty cycle) comes into urea injector

% For the SCR test1, the p_frequency is 3.33Hz, g_frequency is 0.1Hz,...

% Inputs notifications for scr test1:
% (1) pulse_type: should be either 'Continuous' or 'OnOff'
% (2) p_frequency: 3.33Hz
% (3) g_frequency: 0.1Hz
% (4) ducy_cycle varies (0.2,0.5,0.75,1); 
% Inputs conversion
pulse_period=1/p_frequency; % Pulse inetrval (s) and f is the frequency (Hz)
pulse_width=duty_cycle*pulse_period; % Pulse duty cycle (%) (from 0 to 1)
fs=1000; % Sampling frequency is 1000Hz
t=start_time:1/fs:end_time; % sampling time range
% Single pulse definition
toffset=0.5*pulse_width; % offset of the Sampled aperiodic rectangle (rectpuls) from origin
pulse=rectpuls(t-toffset,pulse_width); % single retangular pulse starting from origin with determined pulse width
plot(t,pulse); % starting single pulse plot

if strcmp(pulse_type,'OnOff')
    if (duty_cycle>0)&(duty_cycle<1)
        % Pulse train generation
        t_delay=start_time:pulse_period:end_time; % the duration of the pulses with each pulse having the duration of determined pulse_period
        d=[t_delay;0.5*(square(2*pi*g_frequency*t_delay)+1)]'; % first column is the pulse time info and second column is the pulse gain info
        % In this case, the pulse gain is to make sure the pulse amplitude...
        % between 0 and 1
        y=5*pulstran(t,d,pulse,fs); % Pulse train generation; times 5 is because to voltage to the switch of 12v power supply is 5v
        % Plot the sigal
        Injection_pulse=plot(t,y)
        Injection_pulse.LineWidth=1;
        Injection_pulse.Color='r'
        xlabel('Time (s)')
        ylabel('Injection Waveform (V)')
    elseif duty_cycle==0
        % Pulse train generation
        t_delay=start_time:pulse_period:end_time; % the duration of the pulses with each pulse having the duration of determined pulse_period
        d=[t_delay;0.5*(square(2*pi*g_frequency*t_delay)+1)]'; % first column is the pulse time info and second column is the pulse gain info
        % In this case, the pulse gain is to make sure the pulse amplitude...
        % between 0 and 1
        y=5*pulstran(t,d,0,fs); % Pulse train generation
        % Plot the sigal
        Injection_pulse=plot(t,y)
        Injection_pulse.LineWidth=1;
        Injection_pulse.Color='r'
        xlabel('Time (s)')
        ylabel('Injection Waveform (V)')
    else
        disp('Duty_cycle cannot be 1 in the test, the maximum duty_cycle is 0.99')
        
    end
 
elseif strcmp(pulse_type,'Continuous')
    % Pulse train generation
    t_delay=start_time:pulse_period:end_time; % the duration of the pulses with each pulse having the duration of determined pulse_period
    d=t_delay; % first column is the pulse time info and second column is the pulse gain info
    % In this case, the pulse gain is to make sure the pulse amplitude...
    % between 0 and 1
    y=abs(5*pulstran(t,d,pulse,fs)); % Pulse train generation
    % Plot the sigal
    Injection_pulse=plot(t,y)
    Injection_pulse.LineWidth=1;
    Injection_pulse.Color='r'
    xlabel('Time (s)')
    ylabel('Injection Waveform (V)')
else
    disp('Remind: The pulse_type should either be ''Continuous'' or ''OnOff'' !')
end
    

end

