function [marg_OP_MODE, marg_AUTO_DEC] = perform_inference(bnet)
    N = 9;  % Number of nodes
    
    % Create inference engine
    engine = jtree_inf_engine(bnet);
    
    % Define evidence: QoS UAV = OK, QoS Local communication = OK, QoS Cloud communication = OK
    QoS_UAV = 7; QoS_LOCAL = 8; QoS_CLOUD = 9;
    evidence = cell(1, N);
    evidence{QoS_UAV} = 1;   % QoS UAV OK
    evidence{QoS_LOCAL} = 1; % QoS Local communication OK
    evidence{QoS_CLOUD} = 1; % QoS Cloud communication OK
    
    % Perform the inference
    [engine, loglik] = enter_evidence(engine, evidence);
    
    % Extract the posterior probabilities
    OP_MODE = 1; AUTO_DEC = 2;
    marg_OP_MODE = marginal_nodes(engine, OP_MODE);
    marg_AUTO_DEC = marginal_nodes(engine, AUTO_DEC);
end
