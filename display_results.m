function display_results(marg_OP_MODE, marg_AUTO_DEC)
    fprintf('\n');

    % Define labels for the states of the nodes
    OP_MODE_labels = {'Local', 'Hybrid'};
    AUTO_DEC_labels = {'Full autonomy', 'Low autonomy'};
    
    % Display Operating Mode results
    fprintf('Operating Mode:\n');
    for i = 1:length(marg_OP_MODE.T)
        fprintf('%s = %.4f\n', OP_MODE_labels{i}, marg_OP_MODE.T(i));
    end
    
    % Display Autonomous decisions results
    fprintf('\nAutonomous decisions:\n');
    for i = 1:length(marg_AUTO_DEC.T)
        fprintf('%s = %.4f\n', AUTO_DEC_labels{i}, marg_AUTO_DEC.T(i));
    end
end
