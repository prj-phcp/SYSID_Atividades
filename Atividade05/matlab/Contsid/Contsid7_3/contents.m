% CONTSID Matlab Toolbox
% Version 7.3 - July 2018
% The CONtinuous-Time System IDentification toolbox.
%
% To be used with Matlab version R2017 or R2018
%
% Centre de Recherche en Automatique de Nancy (CRAN)
% University of Lorraine - France
%
% Hugues GARNIER & Marion GILSON
% e-mail :  hugues.garnier@univ-lorraine.fr
%           marion.gilson@univ-lorraine.fr
%
% Parameter estimation methods for linear transfer function model for SISO or MISO Systems
%
%   Equation error (EE) model structure-based estimation approaches.
%
%     - Least-Squares (LS):
%			*linear filter methods:
%				lsgpmf
%				lssvf
%			*modulating functions methods:
%				lsfmf
%				lshmf
%			*integral methods:
%				lsbpf
%				lstpf
%				lssimps
%				lscheby1
%				lscheby2
%				lshermit
%				lslaguer
%				lslegend
%				lsfourie
%				lswalsh
%				lslif
%				lsrpm
%
%     - Instrumental Variable (IV) built from an auxiliary model:
%			*linear filter methods:
%				ivgpmf
%				ivsvf
%			*modulating functions methods:
%				ivfmf
%				ivhmf
%			*integral methods:
%				ivbpf
%				ivtpf
%				ivsimps
%				ivcheby1
%				ivcheby2
%				ivhermit
%				ivlaguer
%				ivlegend
%				ivfourie
%				ivwalsh
%				ivlif
%				ivrpm
%
%     -  Refined Instrumental Variable (RIVC)-based estimation approaches
%               srivc
%               rivc
%               tfsrivc
%               tfrivc
%               procsrivc
%
%   - Prediction error model (PEM)-based estimation approaches.
%				coe
%               tfcoe
%
%     - Bias-Compensating Least-squares methods:
%				bcgpmf
%				bcfmf
%
%     - Weighted Least-Squares:
%				wlsfmf
%				wlshmf
%
%
%   - Model structure determination
%               srivcstruc
%               selcstruc
%
% Parameter estimation methods for linear state-space model
%				sidgpmf
%				sidhmf
%				sidfmf
%				sidlif
%				sidrpm
%
%				sslsgpmf
%				ssivgpmf
%				ssbcgpmf
%
% Parameter estimation methods for linear I/O polynomial model of SISO Systems in closed loop
%				clsrivc
%				clrivc
%				cl2srivc
%
% Parameter estimation methods for linear transfer function plus delay model from relay feedback test
%				tffsrivc
%				tffcoe
%
% Parameter estimation methods for SISO EIV models
%				tocls
%				tocils
%				focls
%				focils
%
% RIVC-based estimation methods for SISO Hammerstein models
%				hsrivc
%				hrivc
%
% RIVC-based parameter estimation methods for SISO Hammerstein-Wiener models
%				hwsrivc
%
% RIVC-based parameter estimation methods for SISO LPV models
%               lpvsrivc
%				lpvrivc
%
% Recursive estimation methods for SISO LTV models
%               rlssvf
%               rivsvf
%               rsrivc
%
% Parameter estimation method for a particular partial differential
% equation model (heat diffusion problem)
%               pdelssvf4heatdiffusion
%               pdesrivc4heatdiffusion
%               pderivc4heatdiffusion
%
% Input generation
%               prbs
%
% DSP of a prbs
%               specprbs
%
% Output generation
% 				sineresp1
%				sineresp2
%               sineresp
%               compress
%               relay
%		    	simc
%
% Model validation
%               comparec
%               residc
%
% Discrete Hartley Transformation
%				dht
%
% Runge Kutta integration method
%               rk4
%
% Linear Transform computation
%               svf
%               gpmf
%               fmf
%               hmf
%               lif
%               rpm
%
% Model form manipulation
%               model_info
%               par2poly
%
% Data or model analysis
%               mkstable
%               settime
%               ispwc
%               isstable
%               icss
%               remdelay
%
% Files containing real data
%				contsid_canning.mat
%               contsid_crane.mat
%               contsid_dryer.mat
%				contsid_heatdata.mat
%               contsid_robotarm.mat
%               contsid_winding.mat
%				dryer_contsidgui.mat
%
% Maine demonstration program
%    contsid_demo - Demonstrations and background information.
%
% CONTSID Graphical User Interface (GUI)
%    contsidgui
%
%  Copyright (c) 2018 by Centre de Recherche en Automatique de Nancy (CRAN)
%  University of Lorraine - France
%  Authors : Hugues Garnier & Marion Gilson


