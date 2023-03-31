% Dados de Sistema 2
%
% Operação de Sistemas de Energia Elétrica
%
% Renan Silveira Sena
%-----------------------------------------------------------------
global TFIM teta12 teta13 teta23 X12 X13 X23 DPD_pu2 PD_pu2 REG_pu2 E2 TW2 TG2 PD_pu2 Kps2 Tps2

%========================== Entrada de Dados =====================
%

%--------------------- Sistema Elétrico
PN  = 397;         % Pot. nominal (Mw)
PB  = 100;         % Pot. base (Mw)
PD  = 189.3234;    % Pot. demandada (Mw)
DPD = 7.0494;      % Entrada de carga (Mw)
D   = 3.1581;      % Coeficiente de amortecimento do sistema (%/Hz)
H   = 6.5557;      % Cte de inércia do sistema (s)
f0  = 60.0;        % Frequencia nominal (Hz)
Td = 0.01;
%--------------------- Turbina
TW2  = 1.2650;         % Cte de tempo da turbina hidaulica (s)

%--------------------- Regulador
TG2  = 0.6002;         % Cte de tempo do regulador (s)
E2   = 5.0128;         % Estatismo permanente (%)

%--------------- Cálculo da Energia de Regulação -----------------

R      = (E2/100)*f0/PN; % Regulagem
REG    = 1/R;           % Energia de regulação - Mw/Hz
REG_pu = REG/PB;        % Energia de reg em pu-Mw/Hz

%------------- Valores Mínimos
emin   = 20;       % Estatismo transitório (%)
Ttmin  = 0.5;      % Cte de tempo transitória (s)
Kimin = -2.2;
Kpmin = -REG_pu;
Kdmin = 0;
%------------- Valores Máximos
emax   = 120;      % Estatismo transitório (%)
Ttmax  = 19.0; % Cte de tempo transitória (s) 
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
DPD_pu2 = DPD/PB;       % Entrada de Carga pu-Mw
PD_pu2  = PD/PB;        % Carga pu-Mw
D_pu   = D*PD_pu2/f0;   % pu - Mw/Hz
H_pu   = H * PN/PB;     % H é referido à capacidade total de geração


%---------------- Cálculo do bloco sistema -----------------------

Kps2 = 1/D_pu;
Tps2 = 2*H_pu/(D_pu*f0);

%--------------- Cálculo da Energia de Regulação -----------------

R      = (E2/100)*f0/PN; % Regulagem
REG    = 1/R;            % Energia de regulação - Mw/Hz
REG_pu2 = REG/PB;        % Energia de reg em pu-Mw/Hz




