function draw_bayesian_network(bnet)
    % Node names
    node_names = {'Operating Mode', 'Autonomous decisions', 'UAV', 'Local communications', ...
                  'Cloud communications', 'Table', 'QoS UAV', 'QoS Local communication', 'QoS Cloud communication'};
    
    % Draw the graph
    figure;
    draw_graph(bnet.dag, node_names);
    title('Bayesian Network Structure');
end
