%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes variables for the Simulink model of an electric motor %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Start with a clean slate
clear all;

integrator = tf(1,[1 0]);

% Motor parameters DC-max 22 S
% Electrical
R1  = 6.28;                % Armature resistance (R)
L1  = 0.413e-3;              % Armature inductance (H)

% Bridge
Km1 = 19.3e-3;               % Motor constant (Nm/A) - Torque Constant
Kb1 = 1/((494*pi)/30);       % Back-EMF constant 1/(rad/s/V) - 1/Speed Constant - Same as Km

%T=Km*I_no_load
T1 = Km1*11.7e-3;             %Torque to determine B  T = Km*No_load_current
                            
% Mechanical
J1  = 4.98e-7;          % Armature inertia Datasheet - Rotor Inertia kg*m^2
%B = (No_load_speed/T)^-1
B1  = T1/(5890*pi/30);



% Motor parameters DC-max 16 S
% Electrical
R2  = 19.1 ;                % Armature resistance (R)
L2  = 0.610e-03;              % Armature inductance (H)

% Bridge
Km2 = 15.0e-3;               % Motor constant (Nm/A) - Torque Constant
Kb2 = 1/((637*pi)/30);       % Back-EMF constant 1/(rad/s/V) - 1/Speed Constant - Same as Km

%T=Km*I_no_load
T2 = Km2*6.90e-3;             %Torque to determine B  T = Km*No_load_current
                            
% Mechanical
J2  = 1.05e-7;          % Armature inertia Datasheet - Rotor Inertia kg*m^2
%B = (No_load_speed/T)^-1
B2  = T2/(7560*pi/30);
%1/((11800*pi/30)/T);       % Armature damping (rad/s / Nm) (1/B)?



% Motor parameters RE 6 6V
% Electrical
R3  = 37.2;                % Armature resistance (R)
L3  = 0.363e-3;              % Armature inductance (H)

% Bridge
Km3 = 2.16e-3;               % Motor constant (Nm/A) - Torque Constant
Kb3 = 1/((3310*pi)/30);       % Back-EMF constant 1/(rad/s/V) - 1/Speed Constant - Same as Km

%T=Km*I_no_load
T3 = Km3*10.7e-3;             %Torque to determine B  T = Km*No_load_current
                            
% Mechanical
J3  = 0.0162e-7;          % Armature inertia Datasheet - Rotor Inertia kg*m^2
%B = (No_load_speed/T)^-1
B3  = T3/(18600*pi/30);
%1/((11800*pi/30)/T);       % Armature damping (rad/s / Nm) (1/B)?


% Display some results
G1  = tf(Km1, [L1*(J1+18701.185e-09) (L1*B1 + R1*(J1+18701.185e-09)) R1*B1]);
H1  = tf(Kb1, 1);
motorTF1 = feedback(G1,H1)
tf_amp1 = tf([8.029e07], [1 7179 3.552e07]);
sys1 = tf(tf_amp1*motorTF1*integrator);
%step(feedback(0.009*sys1,1));
%rlocus(sys1);
%sisotool(sys1);

% Display some results
G2  = tf(Km2, [L2*(J2+18079.394e-09) (L2*B2 + R2*(J2+18079.394e-09)) R2*B2]);
H2  = tf(Kb2, 1);
motorTF2 = feedback(G2,H2);
tf_amp2 = tf([8.126e07], [1 7243 3.59e07]);
sys2 = tf_amp2*motorTF2*integrator
%step(feedback(sys2,1))
%rlocus(sys2)
%sisotool(sys2);
%step(feedback(tf(tf_amp2*motorTF2),1))
ku2 = margin(sys2)


% Display some results
G3  = tf(Km3, [L3*(J3+0.006e-7) (L3*B3 + R3*(J3+0.006e-7)) R3*B3]);
H3  = tf(Kb3, 1);
motorTF3 = feedback(G3,H3)
tf_amp3 = tf([1.412e08], [1 1.475e04 1.191e08]);
sys3 = tf(tf_amp3*motorTF3*integrator);
%step(feedback(sys3,1));
%sisotool(sys3)
%rlocus(sys3)

Ampnum1 = [8.029e07];
Ampden1 = [1 7179 3.552e07];

Ampnum2 = [8.126e07];
Ampden2 = [1 7243 3.59e07];


Ampnum3 = [1.412e08];
Ampden3 = [1 1.475e04 1.91e08];

R = pi/180
%Path for first sequence
A1 = [50 50 10 10 30 30 10 5 10 15 0 45 50 ] * R
E1 = [110 110 90 90 90 90 110 110 70 85 110 110 85 90   ] * R
W1 = [0 0 -90 -90 0 0 -90 -90 -90 -25 -90 75 75] * R
G1 = [0 0 0 0 0 45 45 0 0 60 60 0 75 75 75 ] * R

%Path for second sequence
A2 = [50 50 20 35 45 10 10 10 20 20 0 45 50 ] * R
E2 = [110 110 120 120 90 120 110 70 80 80 110 110 85 90   ] * R
W2 = [0 0 50 50 0 0 -90 -90 -25 -25 -90 75 75] * R
G2 = [0 0 60 0 0 60 60 0 0 60 60 0 75 75 75 ] * R

%Path for third sequence
A3 = [50 50 10 5 10 25 10 5 50 50 10 10 50 ] * R
E3 = [110 110 110 80 80 80 80 110 110 85 130 110 85 90   ] * R
W3 = [0 0 -90 -90 -45 -45 -90 -90 75 75 75 75 75] * R
G3 = [0 0 0 0 0 60 60 60 0 60 60 0 75 75 75 ] * R


