import numpy as np

def matReg(y,u,ny,nu):
    # for debuging code
    # y= np.array([1, 2, 3,4,5,6,7,8,9,10])
    # u= np.array([1, 2, 3,4,5,6,7,8,9,10])

    p = np.max((ny,nu)) + 1
    (N,) = y.shape
    (Nu,) = u.shape
    
    # sanity check
    if N != Nu:
        print('Dimensions of u and y vector are not consistent')
        return (-1,-1)
    
    # create target vector
    target = y[p-1:N]

    # create regression matrix
    Phi = np.zeros((N-p+1,ny+nu))
    for i in range(ny):
        Phi[:,i]    = y[p-i-2: N - i-1].reshape(-1)

    for i in range(nu):
        Phi[:,i+ny] = u[p-i-2: N - i-1].reshape(-1)

    return (target, Phi)

def freeRun(model, y, u,ny,nu):
    p = max(ny,nu) + 1 
    (N,) = y.shape

    yhat = np.zeros(N)
    yhat[:p-1] = y[:p-1].reshape(-1) # include initial conditions

    for k in range(p,N+1):
        # print(k)
        auxY = np.concatenate((  yhat[(k-p):(k-1)].reshape(-1)   ,  (0,)   ),axis=0)
        auxU = np.concatenate((  u   [(k-p):(k-1)].reshape(-1)   ,  (0,)   ),axis=0)
        
        _,fr_input = matReg(auxY,auxU,ny,nu)
        yhat[k-1] = model.predict(fr_input)
    # return only the values that are predictions
    # (remove the initial conditions)
    return yhat[-(N-p+1):] 