function [y] = rk4(A,B,C,D,u,t,x0,method)
%	[Y] = RK4(A,B,C,D,U,T)
%	[Y] = RK4(A,B,C,D,U,T,X0,METHOD)
%
%	Simulation of a linear continuous-time system using Runge-Kutta 
%	4th-order method. The system is given as a continuous-time state-space 
%	model. The data can be regularly or irregularly sampled
%
%	Y	:	matrix of system outputs, each column represents 
%			an output
%	A,B,C,D : continuous-time state-space representation of the system		
%	U	:	matrix of the inputs, each column contains
%			an input. 
%	T	:	vector, time-instants at which the data are
%			regularly or irregularly sampled 
%
%	optional parameters :
%
%	X0	:	vector of initial conditions (null by default)
%	METHOD	:	'zoh' zero order hold on the inputs if they are piecewise constant
%			    'foh' first order hold on the inputs (linear interpolation of inputs)
%	By default, METHOD is set automatically by a test on the input signal
%

%	H. Garnier & E. Huselstein 06/07/99
%   Revision:  14 mars 2002 by E. Huselstein
%              2 May 2004 by H. Garnier
%	CRAN - Centre de Recherche en Automatique de Nancy
%	e-mail : hugues.garnier@cran.uhp-nancy.fr
%	---------------------------	Tests	-------------------------------------------


if(nargin<8),	method=[]; end;
if(nargin<7),	x0=[]; end;
if nargin<6	help rk4;  return;end

% Initial conditions
[nlA,ncA]=size(A);
if(isempty(x0)),	x0	=       zeros(1,nlA);  	end;
[nl,nc]=size(x0);
if(nl>nc), x0=x0'; end;


%	Automatic test on the inputs type : piecewise constant or not
% 	for setting of the interpolation method to zoh or foh.

if (isempty(method))	
    Ncap= length(u);
    udiff	=	diff( u' );		
	udiff	=	udiff(:,1:Ncap-2) .* udiff(:,2:Ncap-1);	
    interpolation=any(any(udiff));
%     if ( any(any(udiff)) ) 
% 		method	=	'foh';
% 	else 					
% 		method	=	'zoh';
% 	end   
elseif method(1) == 'z', interpolation=0; 
else interpolation=1; 
end;
warning off
y=rk4_mex(A,B,C,D,u,t,x0,interpolation);
warning on



% %-----------------------------        Initialisation of RK4      -------------------------
% 
% if ( method(1) == 'z' ) 		%	input is piecewise constant
% 	u_k_demi	=	u;
% 	u_k_1		=	u;
% else 		
% 	for ( i = 1 : Ncap-1 )
% 	u_k_demi(: ,i)	=	( u( : , i ) + u( : , i + 1 ) ) / 2 ;
% 	u_k_1( : , i)	=	u( : , i + 1 );
% 	end;
% end   
% 
% X(:,1)	=	x0;
% 
% 
% %-----------------------------        RK4 loop      ---------------------------------------
% dt	= 	diff(t);
% for ( i = 1 : (Ncap-1) )
% 	K0	=	dt(i)	*	( A * X(:,i) + B * u(:,i) );
% 	K1	=	dt(i)	*	( A * ( X(:,i) + 0.5 * K0 ) + B * u_k_demi(:,i) );
% 	K2	=	dt(i)	*	( A * ( X(:,i) + 0.5 * K1 ) + B * u_k_demi(:,i) );
% 	K3	=	dt(i)	*	( A * ( X(:,i) + K2 ) + B * u_k_1(:,i) );
% 	X(:,i+1)=	X(:,i)	+	1/6 * ( K0 + 2 * K1 + 2 * K2 + K3 );
% end;
% 	y	=	C * X	+ D * u;
% 	y	=	y';
% 

