%% Amplifier 1 Transfer Funcion
%          8.029e07
%   -----------------------
%   s^2 + 7179 s + 3.552e07

amp_tf_motor1 = tf([8.029e07], [1 7179 3.552e07]);

%% Amplifier 2 Transfer Funcion
%          8.126e07
%   ----------------------
%   s^2 + 7243 s + 3.59e07

amp_tf_motor2 = tf([8.126e07], [1 7243 3.59e07]);

%% Amplifier 3 Transfer Function
%            1.412e08
%   ---------------------------
%   s^2 + 1.475e04 s + 1.191e08

amp_tf_motor3 = tf([1.412e08], [1 1.475e04 1.191e08]);
% amp_tf_motor3 = tf([-3811 1.92e08], [1 1.858e04 1.61e08]);
% step(amp_tf_motor3)

%% Amplifier 4 Transfer Function
%            1.412e08
%   ---------------------------
%   s^2 + 1.475e04 s + 1.191e08

amp_tf_motor4 = tf([1.412e08], [1 1.475e04 1.191e08]);
