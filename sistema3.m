% Dados de Sistema 3
%
% Operação de Sistemas de Energia Elétrica
%
% Renan Silveira Sena
%-----------------------------------------------------------------
global TFIM teta12 teta13 teta23 X12 X13 X23 DPD_pu3 PD_pu3 REG_pu3 E3 TW3 TG3  PD_pu3  Kps3 Tps3

%========================== Entrada de Dados =====================
%

%--------------------- Sistema Elétrico
PN  = 28;          % Pot. nominal (Mw)
PB  = 100;         % Pot. base (Mw)
PD  = 302.9174;    % Pot. demandada (Mw)
DPD = 11.2790;     % Entrada de carga (Mw)
D   = 1.2533;      % Coeficiente de amortecimento do sistema (%/Hz)
H   = 7.2292;      % Cte de inércia do sistema (s)
f0  = 60.0;        % Frequencia nominal (Hz)
Td = 0.01;
%--------------------- Turbina
TW3  = 1.3430;         % Cte de tempo da turbina hidaulica (s)

%--------------------- Regulador
TG3  = 0.4505;         % Cte de tempo do regulador (s)
E3   = 4.3172;         % Estatismo permanente (%)

%--------------- Cálculo da Energia de Regulação -----------------

R      = (E3/100)*f0/PN; % Regulagem
REG    = 1/R;            % Energia de regulação - Mw/Hz
REG_pu = REG/PB;         % Energia de reg em pu-Mw/Hz

%------------- Valores Mínimos
emin   = 20;       % Estatismo transitório (%)
Ttmin  = 0.5;      % Cte de tempo transitória (s)
Kimin = -2.2;
Kpmin = -REG_pu;
Kdmin = 0;
%------------- Valores Máximos
emax   = 120;      % Estatismo transitório (%)
Ttmax  = 19.0;     % Cte de tempo transitória (s) 
Kimax = 0.3;
Kpmax = 0;      
Kdmax = 10;


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
DPD_pu3 = DPD/PB;       % Entrada de Carga pu-Mw
PD_pu3  = PD/PB;        % Carga pu-Mw
D_pu   = D*PD_pu3/f0;   % pu - Mw/Hz
H_pu   = H * PN/PB;     % H é referido à capacidade total de geração


%---------------- Cálculo do bloco sistema -----------------------

Kps3 = 1/D_pu;
Tps3 = 2*H_pu/(D_pu*f0);

%--------------- Cálculo da Energia de Regulação -----------------

R      = (E3/100)*f0/PN; % Regulagem
REG    = 1/R;            % Energia de regulação - Mw/Hz
REG_pu3 = REG/PB;        % Energia de reg em pu-Mw/Hz




