function [k,cond]=my_fitness(x)
    %Financial Instiution Deposit
    D=60;
    
    % Required Reserve Ration
    K=0.15;
    
    % Array containing Loan Sizes
    L=[10 25 4 11 18 3 17 15 9 10];
    
    % Array containing Interest Rates for the Loans r_L
    Interest=[0.021 0.022 0.021 0.027 0.025 0.026 0.023 0.021 0.028 0.022];
    
    % Expected Loan Loss (Lamda from Credit Rating)
    lamda=[0.0002 0.0058 0.0001 0.0003 0.0024 0.0002 0.0058 0.0002 0.001 0.001];
    
    % Customer Transaction Rate
    % r_T=0.01;
    
    % Institutional Transaction Cost (T)
    T=(1-K)*D-L;
    %T=(1-K)*D-L;
    
    % Loan Revenue
    Loan_Revenue=(Interest.*L-lamda)*x.';
    
    % Total Transactional Cost
    Total_Transactional_Cost=(0.01*T*x.');
    % Total_Transactional_Cost=(Interest.*T)*x.';
    
    % Cost of Demand Deposit (Beta)
    Beta=0.009*D;
    
    k=-(Loan_Revenue + Total_Transactional_Cost - Beta - lamda*x.');
    %k=-((Interest.*L-lamda+0.01*(0.85*D-L)-lamda)*x.'-0.009*D);
    
    cond=L*x.'<=(1-K)*D;
    
end
