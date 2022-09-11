function [y_pred, theta_pred] = RLS(y, u, na, nb, flg, lbd)
    % Funcao para realização do ajuste por mínimos quadrados reecursivo
    %
    % Entradas
    %
    % y   = vetor de saidas (valores do sistema)
    % u   = vetor de entradas (perturbacoes externas)
    % na  = numero de passos defasados de y
    % nb  = numero de passos defasados de u
    % flg = flag que indica o metodo para rastreio de
    %       mudancas em parametros:
    %           flg = 1: Sem método (RLS puro)
    %           flg = 2: random walk
    %           flg = 3: forgetting factor
    % lbd = forgetting factor (para flg = 3)
    % Saidas
    %
    % y_pred     = Vetor de predicao (saídas estimadas)
    % theta_pred = Valores de theta ao longo ddo tempo
    

    %Step 1 - Inicialização
    p = max ([na, nb]) + 1;       % minimo tamanho das amostras
    N = length (y);               % tamanho do vetor de entrada

    P  = 1e4*eye(na + nb);        % P initial condition
    th = 0*ones(na + nb,1);       % theta initial condition
    lambda = lbd;                 % forgetting factor
    y_pred = zeros(N,1);          % prediction
    e  = zeros(N,1);              % prediction error
    strategy = flg;               % strategy definition
    theta_pred = [];
    
    for i=p:N

        % Loop 1 - Preenchendo com os valores atrasados de y
        Phi = [];
        for j=1:na
            Phi = [Phi -y(i-j)];
        endfor

        % Loop 2 - Preenchendo com os valores de u
        for j=1:nb
            Phi = [Phi u(i-j)];
        endfor

        y_pred(i) = Phi*th;
        e(i) = y(i) - y_pred(i);

        switch strategy
            case 3   % forgetting factor
                K = P*Phi'/(lambda+Phi*P*Phi');
            otherwise
                K = P*Phi'/(1+Phi*P*Phi');
        end
    
        th = th + K * e(i);
       
        switch strategy
            case 1 % RLS
                P = P-K*(P*Phi')'; 
            case 2 % random walk
                P = P-K*(P*Phi')'; 
                p = length(th)+1;
                q = trace(P)/p;
                Q = q*eye(size(P));
                P = P + Q;
            case 3 % forgetting factor
                P = 1/lambda*(P-K*(P*Phi')');
        end

        theta_pred = [theta_pred th];

    endfor

endfunction