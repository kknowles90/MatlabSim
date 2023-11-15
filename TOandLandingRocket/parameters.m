% Kyle Knowles - Model Falcon 1 Rocket T/O and Landing
% This is going to be a 3dof model on a rocket TO and Land
%The rocket will be modeled after a Falcon 1 rocket, specs below.
%The goald of this project is to gain experience in using Matlab/Simulink

% Falcon 1 specs,
% Thrust (MSL, Vac) = 7800lbf/88700lbf or 346961.28N/394557.26N
% Isp (MSL, Vac) = 267s,300s
% Mass Flow Rate mdot = 134.4 kg/s
% Burn Time = 169s
% Fuel = 47380lb/21491.26kg

% Assumptions, constant mdot, burn time, and Isp
% 
% For real applications, mdot, burn time, and Isp would change as pressure 
% changes based on time/altitude
% 
% Pitch angle will equal flight path angle, until P2, which is the boost
% back burn.
% 
% Dry Mass - 1360.7Kg, Fuel Mass - 21491.26Kg, Payload Mass - 5000Kg
% Length 15m, Diameter 1.5m, C.G Location 7 m from base.

%Hand Calculated Values
% P1 Time of flight - 103s
% P2 Time of flight - 221s
% Max Speed attained - 940 m/s
% Max Height Reached - 32.45km
% Landing Touchdown Speed = 150 m/s
% Liftoff Thrust = 346961.28 N
% Initial Orientation - sigma - 90 degrees
% Landing pad distance from launch 83 km
% Launch site - Cape Canaveral <28.608397 N, 80.604345 W >

% PID Control Design
% PID was chosen in order to elimnate overshoot
% Open Loop TF - 0(s)/T(s)=0.04/S^2
% D-Controller TF - C = (1/0.04)*s = 25*s
% Closed Loop TF - 1/(s+1)
% Closed Loop Permforance e^-t
% d2 = 5 m
% Jy = 200 kg*m^2


%Rocket parameters code

%Engine Model
m_dot = 132; % kg/s
burn_time = 162.25; %s

%Vechile model
m_pay = 5000; % kg
m_dry = 1360.7; % kg
m_zfw = m_pay + m_dry; %zero fuel weight, kg

%Initial Sim Conditions
v_0 = 0.01; %Not zero to avoid dividing by zeros, m/s
g = 9.81; % m/s^2
gam_0 = pi/2; %starter angle, radians
R_E = 6371e3; %Earth Radius, kg
h_0 = 0;
x_0 = 0;

%Pulse gam input after t seconds
% initiate gravity turn
t_turn = 30.0;
gam_in = 0.10;