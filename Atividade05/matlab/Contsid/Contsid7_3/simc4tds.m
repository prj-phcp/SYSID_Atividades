% Compute the response of a continuous-time, linear, SISO system with time-
% delay
%
%               b_0p^m+...+b_m
% y(t_k) = ------------------------ u(t_k-td)
%           p^n+a_1p^(n-1)+...+a_n
%
% where td is the (arbitrary) time-delay.
%
% Syntax:
%
%   y = simc_fw(num,den,u,t);
%   y = simc_fw(___,'PropertyName',PropertyValue,...);
%
%   y       : System response. y has multiple columns containing the output
%             and its time-derivatives of order up to (na-nb) (or na-nb+1
%             if 'foh' is assumed): [y^(n-m) y^(n-m-1)... y].
%   num     : Numerator polynomial.
%   num     : Denominator polynomial.
%   u       : Input sequence.
%   t       : Samplinginstanst of the same length than u. We assume t(1)=0.
%
%	Additional estimation options can be specified through name-value pair
%   arguments. The following names are considered:
%    a. 'InterSample'	: Intersample behaviour.
%                           Default: 'zoh', can be switched to 'foh'
%    b. 'IODelay'       : Time-delay (>=0).
%                           Default: 0
%
%
%   Example:
%         N  = 1000;
%         ns = 8;
%         ts_upper = 0.09;          % upper bound of the sampling period
%         ts_lower = 0.01;          % lower bound of the sampling period
%         Ts = 0.5;                 % clock of the shift register for generating a prbs signal
%         td = 8;
%
%         Ac = [1 2.8 4];
%         Bc = 8;
%
%         % Generate nonuniformly sampled indexs
%         t = rand(N-1,1) * (ts_upper - ts_lower) + ts_lower;
%         t = cumsum([0;t]);
%
%         % Generate a PRBS input signal
%         u = prbs(ns,round(Ts/mean(t(2 : end) - t(1 : end-1))),[-1 1]);
%         while length(u) < length(t)
%             u = [u;u];
%         end
%         u = u(1 : N);
%         y = simc_fw(Ac,Bc,u,t,'iodelay',td);
%         y = y(:,end);
%         plot(t,u,'r',t,y,'b')


