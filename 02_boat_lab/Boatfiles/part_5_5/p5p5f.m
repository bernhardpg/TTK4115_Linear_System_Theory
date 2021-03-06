%% Part 5f
clear all; close all; clc;
run('p5p5e.m');

% Compare different Q matrices for 5.5 e)
%% BIG Q

%{
sim('p5p5fx_e');

% Save variables before changing Q and running again!
psi_measured_time = psi_measured_new.time;
psi_measured_data = psi_measured_new.data;
psi_hat_data = psi_hat_new.data;
psi_w_hat_time = psi_w_hat_new.time;
psi_w_hat_data = psi_w_hat_new.data;
psi_w_data = psi_w_new.data;
b_hat_data = b_hat_new.data;
b_hat_time = b_hat_new.time;

system.Q(2,2) = Q(2,2) * 10000;

sim('p5p5fx_e'); % New values will be placed in variables marked with 'new'


genPlotFile4('Part_5_5_f', 'Comparing measured with estimated compass course with increased Q_2', ...
    'time [s]', 'Heading [deg]',...
    psi_measured_new.time, psi_measured_new.data, psi_hat_new.data, ... % Data from part f with increased Q
    psi_measured_time, psi_measured_data, psi_hat_data, ... % Data from part d)
    '$\psi$ Measured compass course, $Q_2 \gg 1$', '$\hat{\psi}$ Estimated compass course, $Q_2 \gg 1$',...
    '$\psi$ Measured compass course', '$\hat{\psi}$ Estimated compass course');



genPlotFileDiffTime('Part_5_5_f', 'Comparing estimated bias with increased Q_2', 'time [s]', ...
    'Rudder bias [deg]', b_hat_time, b_hat_data, b_hat_new.time, b_hat_new.data, ...
    '$\hat{b}$ Estimated bias', '$\hat{b}$ Estimated bias, $Q_2 \gg 1$');


%{
genPlotFile4('Part_5_5_f', 'Comparing actuall with estimated wave influence with increased Q',...
    'time [s]', 'Heading [deg]',...
    psi_w_hat_new.time, psi_w_new.data, psi_w_hat_new.data, ... % Data from part f with increased Q
    psi_w_hat_time, psi_w_data, psi_w_hat_data, ... % Data from part d)
    '$\psi_w$ Wave influence, $Q \gg 1$', '$\hat{\psi}_w$ Estimated wave influence, $Q \gg 1$', ...
    '$\psi_w$ Wave influence', '$\hat{\psi}_w$ Estimated wave influence');

%}
%}

%% SMALL Q


sim('p5p5fx_e');

% Save variables before changing Q and running again!
psi_measured_time = psi_measured_new.time;
psi_measured_data = psi_measured_new.data;
psi_hat_data = psi_hat_new.data;
psi_w_hat_time = psi_w_hat_new.time;
psi_w_hat_data = psi_w_hat_new.data;
psi_w_data = psi_w_new.data;
b_hat_data = b_hat_new.data;
b_hat_time = b_hat_new.time;

system.Q(2,2) = Q(2,2) / 100;

sim('p5p5fx_e'); % New values will be placed in variables marked with 'new'

genPlotFile4('Part_5_5_f', 'Comparing measured with estimated compass course with decreased Q_2', ...
    'time [s]', 'Heading [deg]',...
    psi_measured_new.time, psi_measured_new.data, psi_hat_new.data, ... % Data from part f with increased Q
    psi_measured_time, psi_measured_data, psi_hat_data, ... % Data from part d)
    '$\psi$ Measured compass course, $Q_2 \ll 1$', '$\hat{\psi}$ Estimated compass course, $Q_2 \ll 1$',...
    '$\psi$ Measured compass course', '$\hat{\psi}$ Estimated compass course');


genPlotFileDiffTime('Part_5_5_f', 'Comparing estimated bias with decreased Q_2', 'time [s]', ...
    'Rudder bias [deg]', b_hat_time, b_hat_data, b_hat_new.time, b_hat_new.data, ...
    '$\hat{b}$ Estimated bias', '$\hat{b}$ Estimated bias, $Q_2 \ll 1$');

%{
genPlotFile4('Part_5_5_f', 'Comparing actuall with estimated wave influence with decreased Q',...
    'time [s]', 'Heading [deg]',...
    psi_w_hat_new.time, psi_w_new.data, psi_w_hat_new.data, ... % Data from part f with increased Q
    psi_w_hat_time, psi_w_data, psi_w_hat_data, ... % Data from part d)
    '$\psi_w$ Wave influence, $Q \ll 1$', '$\hat{\psi}_w$ Estimated wave influence, $Q \ll 1$', ...
    '$\psi_w$ Wave influence', '$\hat{\psi}_w$ Estimated wave influence');

%}

%{
% Compare different Q matrices for 5.5 d)

run('../part_5_5/p5p5d.m');

system.Q = system.Q * 10000;

sim('p5p5dx');

genPlotFile('Part_5_5_f', 'Comparing with results from d) Measured compass course with increased Q', 'time [s]', ...
    'Heading [deg]', psi_measured.time, psi_r_vector.data, psi_measured.data, ...
    '$\psi_r$ (Reference)', '$\hat{\psi}$ (Estimated compass course)');

genPlotFile('Part_5_5_f', 'Comparing with results from d) Estimated bias and rudder input with increased Q', 'time [s]', ...
    'Rudder angle [deg]', b_hat.time, b_hat.data, delta.data, ...
    '$\hat{b}$ (Estimated bias)', '${u}$ (Rudder input)');


system.Q = system.Q / (10000 * 10000);

sim('p5p5dx');

genPlotFile('Part_5_5_f', 'Comparing with results from d) Measured compass course with reduced Q', 'time [s]', ...
    'Heading [deg]', psi_measured.time, psi_r_vector.data, psi_measured.data, ...
    '$\psi$ (Measured compass course)', '$\hat{\psi}$ (Estimated compass course)');

genPlotFile('Part_5_5_f', 'Comparing with results from d) Estimated bias and rudder input with reduced Q', 'time [s]', ...
    'Rudder angle [deg]', b_hat.time, b_hat.data, delta.data, ...
    '$\hat{b}$ (Estimated bias)', '${u}$ (Rudder input)');

    
%}
