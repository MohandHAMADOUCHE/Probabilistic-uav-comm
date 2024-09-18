% Add the BNT paths
add_bnt_paths();

% Measure time and CPU usage for creation
clock0 = clock; cpu0 = cputime;

% Create the Bayesian Network
bnet = create_bayesian_network();

% Number of repetitions for averaging
num_repetitions = 100;

% Initialize accumulators for times
total_creation_cpu = 0;
total_creation_elapsed = 0;
total_inference_cpu = 0;
total_inference_elapsed = 0;

for i = 1:num_repetitions
    % Measure time and CPU for network creation
    clock0 = clock; cpu0 = cputime;
    
    % Create the Bayesian Network
    bnet = create_bayesian_network();
    
    % Measure CPU and elapsed time for network creation
    creation_cpu_seconds = cputime - cpu0;
    creation_elapsed_seconds = etime(clock, clock0);
    
    % Accumulate times
    total_creation_cpu = total_creation_cpu + creation_cpu_seconds;
    total_creation_elapsed = total_creation_elapsed + creation_elapsed_seconds;
    
    % Measure time and CPU usage for inference
    clock1 = clock; cpu1 = cputime;
    
    % Perform inference
    [marg_OP_MODE, marg_AUTO_DEC] = perform_inference(bnet);
    
    % Measure CPU and elapsed time for inference
    inference_cpu_seconds = cputime - cpu1;
    inference_elapsed_seconds = etime(clock, clock1);
    
    % Accumulate times
    total_inference_cpu = total_inference_cpu + inference_cpu_seconds;
    total_inference_elapsed = total_inference_elapsed + inference_elapsed_seconds;
end

% Compute average times
avg_creation_cpu_seconds = total_creation_cpu / num_repetitions;
avg_creation_elapsed_seconds = total_creation_elapsed / num_repetitions;
avg_inference_cpu_seconds = total_inference_cpu / num_repetitions;
avg_inference_elapsed_seconds = total_inference_elapsed / num_repetitions;

% Convert to milliseconds for display
avg_creation_cpu_ms = avg_creation_cpu_seconds * 1000;
avg_creation_elapsed_ms = avg_creation_elapsed_seconds * 1000;
avg_inference_cpu_ms = avg_inference_cpu_seconds * 1000;
avg_inference_elapsed_ms = avg_inference_elapsed_seconds * 1000;

% Display the average times
fprintf('Average Creation CPU time: %.4f seconds - %.2f milliseconds\n', avg_creation_cpu_seconds, avg_creation_cpu_ms);
fprintf('Average Creation elapsed time: %.4f seconds - %.2f milliseconds\n', avg_creation_elapsed_seconds, avg_creation_elapsed_ms);
fprintf('Average Inference CPU time: %.4f seconds - %.2f milliseconds\n', avg_inference_cpu_seconds, avg_inference_cpu_ms);
fprintf('Average Inference elapsed time: %.4f seconds - %.2f milliseconds\n', avg_inference_elapsed_seconds, avg_inference_elapsed_ms);

% Display the results
display_results(marg_OP_MODE, marg_AUTO_DEC);

% Draw the Bayesian Network
draw_bayesian_network(bnet);
