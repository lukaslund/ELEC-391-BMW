% CONVERSIONS
RPM = 60/(2*pi);
RAD = pi/180;
DEG = 180/pi;
gcm2 = 1 / (1000 * 100 * 100);
mNm = 1E-3;
mH = 1E-3;
mA = 1E-3;

%% Motor 1
I_noload1 =            (  11.7 )  * ( mA );
w_noload1 =            (  5890 )  / ( RPM );
TERMINAL_RESISTANCE1 = (  6.28 );
TERMINAL_INDUCTANCE1 = ( 0.413 )  * ( mH );
SPEED_CONSTANT1 =      (   494 );
TORQUE_CONSTANT1 =     (  19.3 )  * ( mNm );
MAX_TORQUE1 =          (  10.3 )  * ( mNm );
INERTIA1 =             (  4.98 )  * ( gcm2 );

%% Motor 2
I_noload2 =            (  6.90 )  * ( mA );
w_noload2 =            (  7560 )  / ( RPM );
TERMINAL_RESISTANCE2 = (  19.1 );
TERMINAL_INDUCTANCE2 = ( 0.610 )  * ( mH );
SPEED_CONSTANT2 =      (   637 );
TORQUE_CONSTANT2 =     (  15.0 )  * ( mNm );
MAX_TORQUE2 =          (  3.92 )  * ( mNm );
INERTIA2 =             (  1.05 )  * ( gcm2 );

%% Motor 3
I_noload3 =            (  10.7 )  * ( mA );
w_noload3 =            ( 18600 )  / ( RPM );
TERMINAL_RESISTANCE3 = (  37.2 );
TERMINAL_INDUCTANCE3 = ( 0.363 )  * ( mH );
SPEED_CONSTANT3 =      (  3310 );
TORQUE_CONSTANT3 =     (  2.88 )  * ( mNm );
MAX_TORQUE3 =          ( 0.316 )  * ( mNm );
INERTIA3 =             (0.0162 )  * ( gcm2 );

%% From SW
J_arm = 0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Motor model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ra1 = TERMINAL_RESISTANCE1;
% La1 = TERMINAL_INDUCTANCE1;
% J1  = INERTIA1;
% kb1 = 1/(SPEED_CONSTANT1/RPM);
% km1 = TORQUE_CONSTANT1;

% % Find B from no load test
% B1 = km*I_noload/w_noload;
