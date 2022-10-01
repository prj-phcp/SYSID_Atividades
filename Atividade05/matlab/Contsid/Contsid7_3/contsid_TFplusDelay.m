clc
echo off

% contsid_TFplusDelay.m

%	H. Garnier
%   Date: 25/07/2018
%	Revision: 7.3   

k=1;
while (k~=4)
	k = menu('Transfer function + delay Model Identification with the CONTSID',...
     'Identification by using a time-domain SRIVC-based method',...
     'Identification by using a time-domain RIVC-based method',...
     'Identification by using a time-domain PEM-based method ',...
     'Quit');

   close all
	if k == 4,  break, end
    if k==1, contsid_TFSRIVC;k=1; end
    if k==2, contsid_TFRIVC;k=1; end
    if k==3, contsid_TFCOE;k=1; end
    close all
end

whitebg('white')

close all
