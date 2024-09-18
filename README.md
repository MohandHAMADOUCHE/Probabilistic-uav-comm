# Probabilistic Model for Communication Mode Selection for Autonomous Multi-UAV Systems

This project focuses on developing a probabilistic model for selecting communication modes in autonomous multi-UAV (Unmanned Aerial Vehicle) systems. It uses Bayesian Networks to make decisions based on real-time data in dynamic environments, enhancing collaboration and mission success rates in multi-UAV operations.

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Results](#results)
- [Submission](#submission)
- [Contributing](#contributing)
- [License](#license)

## Overview

The project addresses the challenge of communication mode selection in multi-UAV (Unmanned Aerial Vehicle) systems, which operate in unpredictable and dynamic environments. By utilizing a probabilistic model based on Bayesian Networks (BN), UAVs can autonomously and adaptively select between two communication networks: a local UAV-to-UAV network and a cloud-based network. This decision is made in real-time based on mission requirements, UAV network state, and environmental data, ensuring effective coordination and mission success. The model demonstrates high efficiency, with rapid decision-making, making it suitable for real-time multi-UAV operations.

## Installation

### System Requirements

- MATLAB (compatible with the BNT toolbox)
- The BNT library from [https://github.com/bayesnet/bnt](https://github.com/bayesnet/bnt)

### Getting Started

This project depends on the [Bayesian Network Toolbox (BNT)](https://github.com/bayesnet/bnt). Follow these steps to set up the BNT library in MATLAB:

1. Clone the BNT repository:
    ```bash
    git clone https://github.com/bayesnet/bnt.git
    ```

2. Clone this project repository:
    ```bash
    git clone https://github.com/MohandHAMADOUCHE/probabilistic-uav-comm
    cd probabilistic-uav-comm
    ```

3. Open MATLAB and modify the variable `myPath` in the `add_bnt_paths()` function to match the path to your extracted BNT directory:

    ```matlab
    myPath = genpathKPM('C:\Users\info\Downloads\bnt\bnt');  % Modify this path as needed
    ```

4. Execute the `main()` function in MATLAB to run the project:

    ```matlab
    main()
    ```

## Results

### Validation with GeNIe

The validation version using the **GeNIe** tool can be found in the folder `GeNie model`, in the file `Communication_network_selection_BN.xdsl`. GeNIe is a tool for modeling and inference of Bayesian Networks. You can download the GeNIe tool from their [official website](https://www.bayesfusion.com/genie/).

#### Resulting Bayesian Network

<p align="center">
  <img src="./GeNie model/BN_picture.PNG" alt="Resulting Bayesian Network" width="400"/>
</p>


*Figure 1: The resulting Bayesian Network after validation in GeNIe.*

### Validation with Matlab

I performed multiple runs to determine the **average CPU time** for both creating the Bayesian Network and performing the inference.

- **Average Bayesian Network Creation Time**: Approximately **1 millisecond**.
- **Average Inference Time**: Approximately **6 milliseconds**.

These averages were obtained after several test executions, ensuring consistency in performance across different runs.

#### Average CPU time images

<p align="center">
  <img src="./Execution%20results/mini_avg_creation_cpu_seconds.png" alt="Average Creation CPU Time" width="300"/>
  <img src="./Execution%20results/mini_avg_inference_cpu_ms.png" alt="Average Inference CPU Time" width="300"/>
</p>

*Figure 2 (left): Average CPU time required to create the Bayesian Network.  
Figure 3 (right): Average CPU time required to perform the inference.*
#### Potential Speedup

On their [website](https://www.cs.ubc.ca/~murphyk/Software/BNT/usage_02nov13.html#installC), they mention that using a C implementation could provide a **5 to 10 times speedup** in performance. This could significantly reduce the execution time for both the creation of the Bayesian Network and the inference process, making it even more suitable for real-time applications.

## Submission

This work is currently under submission for a conference. Once the article is published, a link to the final version of the paper will be provided here.

<!--This work has been published. You can access the article [here](https://link-to-your-article.com). -->

## Contributing

We welcome contributions! If you are interested in improving the model or adding features, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request with a detailed explanation of your changes.

### Reporting Issues

If you encounter any bugs or have suggestions, feel free to open an issue in the repository. We appreciate your feedback!

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
