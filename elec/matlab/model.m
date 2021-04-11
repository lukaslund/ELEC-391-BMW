% Include motor constants
constants

% Path to SimX-Simulink Coupling
addpath 'C:\Users\lukas\Desktop\3rd Year\ELEC391\SimulinkSX'

% Motor model
Ra1 = TERMINAL_RESISTANCE1;
La1 = TERMINAL_INDUCTANCE1;
J1  = INERTIA1;
kb1 = 1/(SPEED_CONSTANT1/RPM);
km1 = TORQUE_CONSTANT1;

Ra2 = TERMINAL_RESISTANCE2;
La2 = TERMINAL_INDUCTANCE2;
J2  = INERTIA2;
kb2 = 1/(SPEED_CONSTANT2/RPM);
km2 = TORQUE_CONSTANT2;

Ra3 = TERMINAL_RESISTANCE3;
La3 = TERMINAL_INDUCTANCE3;
J3  = INERTIA3;
kb3 = 1/(SPEED_CONSTANT3/RPM);
km3 = TORQUE_CONSTANT3;

% Find B from no load test
B1 = km1*I_noload1/w_noload1;
B2 = km2*I_noload2/w_noload2;
B3 = km3*I_noload3/w_noload3;

% Controller
%kp = 100;
ks = 1; % sensor gain
fb = 1/ks;

% Amplifier
trans_funcs
[A_num1, A_den1] = tfdata(amp_tf_motor1, 'v');
[A_num2, A_den2] = tfdata(amp_tf_motor2, 'v');
[A_num3, A_den3] = tfdata(amp_tf_motor3, 'v');

% Motor1 Coefficients
M1N1_1 = km1;
M1D1_1 = La1*J1;
M1D2_1 = (La1*B1 + Ra1*J1);
M1D3_1 = (Ra1*B1 + km1*kb1);

M1N1_2 = km2;
M1D1_2 = La2*J2;
M1D2_2 = (La2*B2 + Ra2*J2);
M1D3_2 = (Ra2*B2 + km2*kb2);

M1N1_3 = km3;
M1D1_3 = La3*J3;
M1D2_3 = (La3*B3 + Ra3*J3);
M1D3_3 = (Ra3*B3 + km3*kb3);

% Transfer Functions
motor_tf_1 = tf([0 M1N1_1],[M1D1_1 M1D2_1 M1D3_1]);
amp_tf_1 = tf(A_num1, A_den1);
int_tf_1 = tf(1,[1 0]);
ol_tf_1 = motor_tf_1 * amp_tf_1 * int_tf_1;

motor_tf_2 = tf([0 M1N1_2],[M1D1_2 M1D2_2 M1D3_2]);
amp_tf_2 = tf(A_num2, A_den2);
int_tf_2 = tf(1,[1 0]);
ol_tf_2 = motor_tf_2 * amp_tf_2 * int_tf_2;

motor_tf_3 = tf([0 M1N1_3],[M1D1_3 M1D2_3 M1D3_3]);
amp_tf_3 = tf(A_num1, A_den1);
int_tf_3 = tf(1,[1 0]);
ol_tf_3 = motor_tf_3 * amp_tf_3 * int_tf_3;

% root locus
% rlocus(ol_tf)
% hold on
% legend('open loop')
% hold off

% Compute ultimate gain
ku1 = margin(ol_tf_1);
kp1 = 0.075*ku1;
kd1 = 0;
ki1 = 0;

ku2 = margin(ol_tf_2);
kp2 = 0.075*ku2;
kd2 = 0;
ki2 = 0;

ku3 = margin(ol_tf_3);
kp3 = 0.075*ku3;
kd3 = 0;
ki3 = 0;
