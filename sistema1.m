% Dados de Sistema 1
%
% Operação de Sistemas de Energia Elétrica
%
% Renan Silveira Sena 
%-----------------------------------------------------------------
global TFIM teta12 teta13 teta23 X12 X13 X23 DPD_pu1 PD_pu1 REG_pu1 E1 TW1 TG1  PD_pu1 Kps1 Tps1

%========================== Entrada de Dados =====================
%

%--------------------- Sistema Elétrico
PN  = 385;         % Pot. nominal (Mw)
PB  = 100;         % Pot. base (Mw)
PD  = 113.5940;    % Pot. demandada (Mw)
DPD = 4.2296;      % Entrada de carga (Mw)
D   = 0.5940;      % Coeficiente de amortecimento do sistema (%/Hz)
H   = 4.2311;      % Cte de inércia do sistema (s)
f0  = 60.0;        % Frequencia nominal (Hz)
Td = 0.01;
%--------------------- Turbina
TW1  = 1.0882;         % Cte de tempo da turbina hidaulica (s)

%--------------------- Regulador
TG1  = 0.6419;         % Cte de tempo do regulador (s)
E1   = 3.9085;         % Estatismo permanente (%)

%--------------- Cálculo da Energia de Regulação -----------------

R      = (E1/100)*f0/PN; % Regulagem
REG    = 1/R;            % Energia de regulação - Mw/Hz
REG_pu = REG/PB;         % Energia de reg em pu-Mw/Hz

%------------- Valores Mínimos - secundário
emin   = 20;       % Estatismo transitório (%)
Ttmin  = 0.5;      % Cte de tempo transitória (s)
Kimin = -2.2;
Kpmin = -REG_pu;
Kdmin = 0;
%------------- Valores Máximos - secundário
emax   = 120;      % Estatismo transitório (%)
Ttmax  = 19.0;     % Cte de tempo transitória (s) 
Kimax = 0.3;
Kpmax = 0;      
Kdmax = 10;

%------------- Valores Mínimos - primário
Gestmin = 0;
Testmin = 0;
%------------- Valores Máximos - primário
Gestmax = 1;
Testmax = 0.1;

% ------ Reatância

X12=0.2221;
X13=0.1417;
X23=0.1490;

%------ Angulos

teta12 = 13.1982*pi/180;
teta13 = 12.0033*pi/180;
teta23 = 0;


%========================== Fim dos Dados =======================

%---------------- passando para pu ------------------------------
PN_pu  = PN/PB;
DPD_pu1 = DPD/PB;       % Entrada de Carga pu-Mw
PD_pu1  = PD/PB;        % Carga pu-Mw
D_pu   = D*PD_pu1/f0;   % pu - Mw/Hz
H_pu   = H * PN/PB;     % H é referido à capacidade total de geração


%---------------- Cálculo do bloco sistema -----------------------

Kps1 = 1/D_pu;
Tps1 = 2*H_pu/(D_pu*f0);

%--------------- Cálculo da Energia de Regulação -----------------

R      = (E1/100)*f0/PN; % Regulagem
REG    = 1/R;            % Energia de regulação - Mw/Hz
REG_pu1 = REG/PB;        % Energia de reg em pu-Mw/Hz




