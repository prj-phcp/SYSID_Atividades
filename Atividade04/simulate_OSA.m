function y_pred = simulate_OSA (Phi, theta)
    % Funcao de simulacao one-step-ahead (OSA) de um sistema linear
    % Discreto
    %
    % Entradas
    %
    % Phi   = Matriz com os valores ajustados
    % theta = Vetor saida do ajuste linear
    %
    % Saidas
    %
    % y_pred = saida predita do sistemas

    y_pred = Phi*theta;

endfunction