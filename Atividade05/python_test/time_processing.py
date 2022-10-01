#from sklearn.base import BaseEstimator, TransformerMixin
from scipy import signal, interpolate
import numpy as np

def interpolation_resample(t, X, y=None, frequency=None, **kwargs):
    '''
    TBD
    '''

    dt_max = t[-1] - t[0]

    if frequency is None:
        nsamples = len(t)
    else:
        nsamples = int(dt_max*frequency)+1

    dt = dt_max/(nsamples-1)
    
    t_out = [t[0] + n*dt for n in range(nsamples)]

    interpX = interpolate.interp1d(t, X, **kwargs)
    X_out = interpX(t_out)
    X_out[-1] = X[-1]

    if y is None:
        y_out = y
    else:
        interpY = interpolate.interp1d(t, y, **kwargs)
        y_out = interpY(t_out)
        y_out[-1] = y[-1]

    return t_out, X_out, y_out




