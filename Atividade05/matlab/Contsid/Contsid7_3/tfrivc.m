%	TFRIVC estimates the parameters of hybrid continuous-time Box-Jenkins
%	models with time-delay using the RIVC (Refined Instrumental Variable
%	for Continuous-time models) method. The plant is modeled in the
%	continuous-time domain while the noise is modeled in the discrete-time
%	domain.
%
%   Syntax:
%
%      [sys,sysN] = TFRIVC(data,np,nz)
%      [sys,sysN] = TFRIVC(data,np,nz,IODelay)
%      [sys,sysN] = TFRIVC(___,Name,Value)
%
%   sys      : Returned IDTF model for the plant.
%   sysN     : Returned IDPOLY model for the noise.
%   data     : Data in IDDATA object format, see help IDDATA.
%              Data should be equally sampled.
%   nz       : Number of zeros in the numerator.
%   np       : Number of poles in the denominator.
%   IODelay  : Initial time-delay.
%
%   Additional estimation options can be specified through name-value pair
%   arguments. The following names are considered:
%       a. 'TdMin'          : Lower time-delay boundary.
%                               Default: 0
%       b. 'TdMax'          : Upper time-delay boundary.
%                               Default: calculated by maximizing the cross
%                               correlation function of the input-output
%                               data
%       c. 'TolPar'         : Tolerence of parameter changes.
%                               Default: 1e-4
%       d. 'TolFun'         : Tolerence of loss function changes.
%                               Default: 1e-4
%       e. 'StepMax'        : Maximum time-delay increment.
%                               Default: inf
%       f. 'StepReduction'  : Time-delay increment reduction factor.
%                             (should be larger than 1)
%                               Default: 2
%       g. 'MaxIter'        : Maximum iteration number.
%                               Default: 100
%       h. 'FixTd'          : Fixing the time-delay or not.
%                               Default: 'off', can be switched to 'on'
%       i. 'Integration'    : Indicator of integration enforced for the
%                             estimation of models (not applicable if the
%                             focus filter is enabled).
%                               Default: 'off', can be switched to 'on'
%       j. 'NN'             : Noise transfer function degree [nd,nc], with
%                             nd denoting the denominator degree while nc
%                             the numerator degree. The noise is estimated
%                             as an DT ARMA model.
%                               Default: [], no noise model is assumed
%       k. 'Focus'          : Cutoff frequency of the focus filter (in
%                             rad/time unit, implemented as a Butterworth
%                             filter) used for prefiltering the data.
%                               Default: inf (all pass filter)
%       l. 'FocusOrder'     : Order of the Focus filter.
%                               Default: 5
%       m. 'NumTd'          : Number of time-delay values in [TdMin TdMax]
%                             to be compared if IODelay is not provided.
%                               Default: 50
%       n. 'Lambda'         : Cutoff frequency the state variable filter
%                             (in rad/time unit).
%                               Default: 1/50 the Nyquist frequency
%
%   If 'IODelay' is not specified, the exhaustive search technique in Chen
%   et al (2018) will be used to generate a reliable initial time-delay.
%
%   An alternative syntax is:
%
%      model = TFRIVC(data,Mi,Name,Value)
%
%   Mi is an estimated model or a model created by IDTF containing
%   structure information and initial values for the parameters. Note that
%   we only extract three parameters from Mi: IODelay, Den and Num. Other
%   parameters, e.g., TdMin and TdMax, should be set through name-value
%   pairs.
%
%   See for further explanations :
%
%   Chen, F., Zhuan, X., Garnier, H., Gilson, M., "Issuess in separable
%   identification of continuous-time models with time-delay", Automatica,
%   2018.


