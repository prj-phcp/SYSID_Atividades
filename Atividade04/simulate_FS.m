function y_pred = simulate_FS (Phi, theta, u, na, nb)
    % Funcao de simulacao livre (FS) de um sistema linear
    % Discreto
    %
    % Entradas
    %
    % Phi   = Primeira linha da matriz a ser rodada
    % theta = Vetor saida do ajuste linear
    % u     = Vetor de forcamento total (partindo do tempo zero)
    % na    = Numero de passos anteriores considerados de y
    % nb    = Numero de passos anteriores considerados de u
    %
    % Saidas
    %
    % y_pred = saida predita do sistemas

    % limitando u
    p = max ([na, nb]) + 1;
    %nmax = length(u);
    u = u(p:end);

    % Inicializando y_pred
    y_pred = [];

    % Extraindo parcelas de phi que sao referentes a y e u
    Phi_y = Phi(1:na);
    Phi_u = Phi(na+1:na+nb);
    nmax = length(u);

    % Iterando no total de forcamentos
    for i=1:nmax
        y = [Phi_y Phi_u]*theta;
        y_pred = [y_pred; y];
        Phi_y = [-y Phi_y(1:na-1)];
        Phi_u = [u(i) Phi_u(1:nb-1)];
    endfor
    
endfunction