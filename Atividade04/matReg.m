function [Phi, Y] = matReg (y, u, na, nb)
    % Funcao para a partir de um vetor de amostragem gerar as matrizes
    % para um processo de regressao linear
    %
    % Entradas
    %
    % y  = vetor de saidas (valores do sistema)
    % u  = vetor de entradas (perturbacoes externas)
    % na = numero de passos defasados de y
    % nb = numero de passos defasados de u
    %
    % Saidas
    %
    % Phi = Matriz para o ajuste
    % Y   = vetor resposta a ser ajustado
    
    p = max ([na, nb]) + 1;       % minimo tamanho das amostras
    end_val = length (y);         % tamanho do vetor de entrada
    
    Phi = [];

    % Loop 1 - Preenchendo com os valores atrasados de y
    for i=1:na
        Phi = [Phi -y(p-i:end_val-i)];
    endfor

    % Loop 2 - Preenchendo com os valores de u
    for i=1:nb
        Phi = [Phi u(p-i:end_val-i)];
    endfor

    Y = y(p:end_val);

endfunction