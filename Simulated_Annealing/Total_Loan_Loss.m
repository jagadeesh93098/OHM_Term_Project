function k=Total_Loan_Loss(x)
    % Array containing Loan Sizes
    L=[10 25 4 11 18 3 17 15 9 10];    
    
    % Expected Loan Loss (Lambda from Credit Rating)
    lamda=[0.0002 0.0058 0.0001 0.0003 0.0024 0.0002 0.0058 0.0002 0.001 0.001];
    k=(L.*lamda)*x.';
end