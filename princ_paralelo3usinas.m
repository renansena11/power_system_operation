%--------------------------------------------------------------
%  Operação: Paralelo 3 usinas
%
% Renan Silveira Sena
%
%--------------------------------------------------------------


clear all
clc
close all
global TFIM teta12 teta13 teta23 X12 X13 X23 DPD_pu1 DPD_pu2 PD_pu1 PD_pu2 REG_pu1 REG_pu1 E1 E2  TW1 TG1 TW2 TG2 TW3 TG3 PD_pu1 PD_pu2 PD_pu3  Kps1 Tps1
global Gsae Ta Gest Test e1 Tt1 Ki1 Kp1 Kd1 T1 T2 Tb K12 K1_12 K2_12 B1 B2 C1 C2

 
%------------- Dados da Planta  
%
TFIM  = 1000;

sistema1;
sistema2;
sistema3;

%============================= AVR ========================================

Gest = 0.0586;
Test = 0.0223;


%============================== PID 1 =====================================

 e1 = 68.9388;
 Tt1 = 5.7257;
 Ki1 = 0.0092;
 Kp1 = -0.0242;
 Kd1 = 0.0586; 
 
 %============================== PID 2 =====================================

 e2 = 68.7875;
 Tt2 = 1.0740;
 Ki2 = 0.0541;
 Kp2 = -0.2928;
 Kd2 = 3.2410;
 
 %============================== PID 3 =====================================

 e3 = 98.5067;
 Tt3 = 1.0552;
 Kp3 = 0.3558;
 Kd3 = 0.2826;
 


%============================  SAE ========================================

T1 = 0.1013;
T2 = 0.1238;
Tb = 0.08;
Gsae = 0.1250;
Ta = 0.4401;


%==============================  BIAS =====================================

B1 = 0.6;
B2 = 0.6;
C1 = 0.6;
C2 = 0.6;
     
%=====================  LINHA DE TRANSMISSÃO ==============================

% ------ Linha 1-2


K12 = cos(teta12)/X12;
K1_12 = sin (teta12)/X12;
K2_12 = sin(teta12)/X12;

% ------ Linha 1-3

K13 = cos(teta13)/X13;
K1_13 = sin (teta13)/X13;
K2_13 = sin(teta13)/X13;

% ------ Linha 2-3

K23 = cos(teta23)/X23;
K1_23 = sin (teta23)/X23;
K2_23 = sin(teta23)/X23;

%=====================  SAÍDA GRÁFICA =====================================


sim('paralelo3usinas',[0,TFIM])

plot(tout,Delta_FR1) %Plotando gráfico da frenquência
title('Frequency Deviation - sistema 1')
xlabel('seg')
ylabel('Hz')

figure

plot(tout,Delta_FR2) %Plotando gráfico da frenquência
title('Frequency Deviation - sistema 2')
xlabel('seg')
ylabel('Hz')

figure

plot(tout,Delta_FR3) %Plotando gráfico da frenquência
title('Frequency Deviation - sistema 3')
xlabel('seg')
ylabel('Hz')

figure

plot(tout,Delta_T12) %Plotando gráfico da frenquência
title('Intercambio 12')
xlabel('seg')
ylabel('Potência (pu)')

figure

plot(tout,Delta_T23) %Plotando gráfico da frenquência
title('Intercambio 23')
xlabel('seg')
ylabel('Potência (pu)')



