function bnet = create_bayesian_network()
    % Number of nodes
    N = 9;
    
    % Define the structure of the network
    dag = zeros(N, N);
    
    % Nodes
    OP_MODE = 1; AUTO_DEC = 2; UAV = 3; LOCAL_COMM = 4; CLOUD_COMM = 5;
    TABLE = 6; QoS_UAV = 7; QoS_LOCAL = 8; QoS_CLOUD = 9;
    
    % Define the arcs between nodes
    dag(OP_MODE, AUTO_DEC) = 1;
    dag(AUTO_DEC, UAV) = 1; dag(AUTO_DEC, LOCAL_COMM) = 1; dag(AUTO_DEC, CLOUD_COMM) = 1;
    dag(UAV, TABLE) = 1; dag(LOCAL_COMM, TABLE) = 1;
    dag(UAV, QoS_UAV) = 1; dag(LOCAL_COMM, QoS_LOCAL) = 1; dag(CLOUD_COMM, QoS_CLOUD) = 1;
    
    % Define the node sizes (all nodes are binary)
    node_sizes = 2 * ones(1, N);
    
    % Node names
    node_names = {'Operating Mode', 'Autonomous decisions', 'UAV', 'Local communications', ...
                  'Cloud communications', 'Table', 'QoS UAV', 'QoS Local communication', 'QoS Cloud communication'};
    
    % Create the Bayesian Network
    bnet = mk_bnet(dag, node_sizes, 'names', node_names, 'discrete', 1:N);
    
    % Define the CPTs for each node
    bnet.CPD{OP_MODE} = tabular_CPD(bnet, OP_MODE, [0.6 0.4]);
    bnet.CPD{AUTO_DEC} = tabular_CPD(bnet, AUTO_DEC, [0.9 0.5 0.1 0.5]);
    bnet.CPD{UAV} = tabular_CPD(bnet, UAV, [0.9 0.4 0.1 0.6]);
    bnet.CPD{LOCAL_COMM} = tabular_CPD(bnet, LOCAL_COMM, [0.9 0.5 0.1 0.5]);
    bnet.CPD{CLOUD_COMM} = tabular_CPD(bnet, CLOUD_COMM, [0.5 0.9 0.5 0.1]);
    bnet.CPD{TABLE} = tabular_CPD(bnet, TABLE, [0.95 0.2 0.2 0.05 0.05 0.8 0.8 0.95]);
    bnet.CPD{QoS_UAV} = tabular_CPD(bnet, QoS_UAV, [1 0 0 1]);
    bnet.CPD{QoS_LOCAL} = tabular_CPD(bnet, QoS_LOCAL, [1 0 0 1]);
    bnet.CPD{QoS_CLOUD} = tabular_CPD(bnet, QoS_CLOUD, [1 0 0 1]);
end