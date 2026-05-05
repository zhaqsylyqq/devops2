flowchart TD
    classDef terraform fill:#844FBA,stroke:#fff,stroke-width:2px,color:#fff;
    classDef ansible fill:#EE0000,stroke:#fff,stroke-width:2px,color:#fff;
    classDef k8s fill:#326CE5,stroke:#fff,stroke-width:2px,color:#fff;
    classDef output fill:#239B56,stroke:#fff,stroke-width:2px,color:#fff;

    %% Step 1: Terraform
    subgraph Step1 ["Step 1: Provision Infrastructure (Terraform)"]
        direction TB
        TF_Init([Terraform Apply]):::terraform --> DO_SSH[Upload SSH Key to DigitalOcean]
        TF_Init --> DO_LB[Create Load Balancer]
        TF_Init --> DO_VM[Create 3 Ubuntu VMs in NYC3]
        
        DO_VM --> TF_Out[Generate Ansible Inventory File]:::output
    end

    %% Connection between steps
    TF_Out -- "Passes IPs & SSH info" --> ANS_Init

    %% Step 2: Ansible
    subgraph Step2 ["Step 2: Install Kubernetes K3s (Ansible)"]
        direction TB
        ANS_Init([Ansible Execution]):::ansible --> Pkg[Install Required Packages]
        Pkg --> Sys[Setup System Settings IPv4/IPv6 forwarding]
        Sys --> Bin[Download & Install K3s Binary]
        
        Bin --> Master1[First Master: Start K3s with --cluster-init]:::k8s
        Bin --> MasterN[Other Masters: Wait for Token]:::k8s
        
        Master1 -- "Generates & Passes Token" --> MasterN
        MasterN --> Join[Other Masters: Join Cluster]:::k8s
        
        Master1 --> Kubeconfig[Configure local kubectl]:::output
    end
