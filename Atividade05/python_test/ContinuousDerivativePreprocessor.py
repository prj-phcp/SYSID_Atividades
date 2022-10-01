from sklearn.base import BaseEstimator, TransformerMixin
import numpy as np
import control.matlab as mtlb



class CDProcessor(BaseEstimator, TransformerMixin):
    '''
    Classe definida para a aplicação de derivadas contínuas a um sinal com espaçamento regular.
    '''

    def __init__(self, order_X=2, order_y=0, output_cols=[1], frequency_cut=1.0):
        '''
        Método para a criação do transformer dedicado a converter os dados em tabelas expandidas
        de suas derivadas estimadas via função de transferência

        Inputs:

        order_X: lista ou inteiro, indica a ordem do sistema
        order_y: lista ou inteiro, indica a ordem das derivadas quanto a saída
        time: vetor de tempos das amostras. Caso seja None, assume-se que a primeira coluna de X será o tempo
        frequency_cut: ponto flutuante, indica a frequência de corte do filtro
        '''

        self.order_X = order_X
        self.order_y = order_y
        self.output_cols = output_cols
        self.frequency_cut = frequency_cut

    def fit(self, X, y=None):

        return self

    def transform(self, X):

        _matrix = []
        time = X[:,0].copy()
        X = X[:,1:].copy()
        if len(X.shape) == 1:
            X = X.copy().reshape(-1,1)
        for i in range(X.shape[1]):
            if i in self.output_cols: 
                drop_original=1
                order = self.order_y
                vec = apply_derivative(X[:,i], time, order, self.frequency_cut, drop_original=drop_original)
            else:
                drop_original=0
                order = self.order_X
                vec = -1 * apply_derivative(X[:,i], time, order, self.frequency_cut, drop_original=drop_original)
            _matrix.append(vec)

        _matrix = np.hstack(_matrix)
        return _matrix

    def check_consistency(self, X, y):

        pass

def apply_derivative(vector, time, order, frequency, drop_original=0):

    s = mtlb.tf('s')
    vector_expanded = []
    for i in range(drop_original, order+1):
        G = (frequency**order) * (s**i / (s + frequency)**order)
        vout, _, _ = mtlb.lsim(G, vector, time)
        vector_expanded.append(vout.reshape(-1,1))

    vector_expanded = np.hstack(vector_expanded)

    return vector_expanded

