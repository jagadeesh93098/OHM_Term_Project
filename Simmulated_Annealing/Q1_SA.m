clear;
clc;
% close all;

tic

% Initial Temperature
T=1000;

% Cooling Rate
alpha=0.9;

% No.of Iterations at a particular Temp
n_iter=100;

% Simulated Annealing
Best_sol_iter=[];
Best_fitness_iter=[];

% Number of Solutions needed in the solution set
n=60;
% Initial Solution Set
solution_set=gen_set(n);

Best_sol=solution_set(1,:);
Best_fitness=my_fitness(Best_sol);

while T>1
    for i=1:n
        f=my_fitness(solution_set(i,:));
        r=rand();
        if f<=Best_fitness
            Best_sol=solution_set(i,:);
            Best_fitness=my_fitness(Best_sol);
        elseif r>exp((f-Best_fitness)/T)
            Best_sol=solution_set(i,:);
            Best_fitness=my_fitness(Best_sol);
        end
    end
    Best_sol_iter(end+1,:)=Best_sol;
    Best_fitness_iter(end+1,:)=Best_fitness;
    T=alpha*T;
    solution_set=gen_set(n);
end


disp("Final Lending Decision (Best Solution)");
disp(Best_sol);
disp("Fitness of Best Solution");
disp(-Best_fitness);
disp("Total Loan Amount");
disp(Total_Loan(Best_sol));
disp("Total Loan Revenue");
disp(Total_Loan_Revenue(Best_sol));
plot(1:size(Best_fitness_iter,1),-Best_fitness_iter,'b-o');
title("Fitness Variation");

% figure();
% Loan_Amount=Total_Loan(Best_sol_iter);
% plot(1:size(Loan_Amount,2),Loan_Amount,'r-*');
% title("Total Loan Amount in Each Iteration from Best Sol.");
% 
% figure();
% Loan_Revenue=Total_Loan_Revenue(Best_sol_iter);
% plot(1:size(Loan_Revenue,2),Loan_Revenue,'b-*');
% title("Total Loan Revenue in Each Iteration from Best Sol.");
% 
% figure()
% Expected_Loan_Loss=Total_Loan_Loss(Best_sol_iter);
% plot(1:size(Expected_Loan_Loss,2),Expected_Loan_Loss,'black-*');
% title("Expected Loan Loss in each Iteration from Best Sol.")

toc