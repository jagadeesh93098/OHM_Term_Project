clear;
clc;

% population generation

pop_size=60;
pop=zeros([pop_size,10]);
i=1;
pop_dec=zeros([pop_size,1]);

while i<pop_size
    k=randi(2^10-1);
    bin_k=dec2bin(k,10)-'0';
    x=cast(bin_k,'double');
    [a,b]=my_fitness(x);
    if b==1 && ismember(k,pop_dec)==0
        pop_dec(i,:)=k;
        pop(i,:)=x;
        i=i+1;
    end
end

avg_fitness=mean(my_fitness(pop));
max_fitness=max(my_fitness(pop));

gens=60;

gen_num=zeros([gens,1]);

tic
for gen=1:gens
    pop_2=[];
    
    [fit,cond]=my_fitness(pop);
    s=sum(fit);
    fit_scaled=fit/s;
    
    for i=1:length(pop)
        s=sum(fit_scaled(1,1:i));
        fit_scaled(2,i)=s;
    end
    
    for iter=1:60
        parent_pool_index=roulettewheelselection(fit_scaled(2,:));
        %disp(parent_pool_index);
        p1=pop(parent_pool_index(1),:);
        p2=pop(parent_pool_index(2),:);
        
        [c1,c2]=crossover(p1,p2,0.8);
        c1_final=mutate(c1,0.006);
        c2_final=mutate(c2,0.006);
        
        if GAMCC(c1_final)==1
            pop_2(end+1,:)=c1_final;
        end
        
        if GAMCC(c2_final)==1
            pop_2(end+1,:)=c2_final;
        end
        
    end
    
    pop=pop_2;
    max_fitness(:,end+1)=max(my_fitness(pop));
    avg_fitness(:,end+1)=mean(my_fitness(pop));
    gen_num(gen,:)=size(pop,1);
end

final_fitness=my_fitness(pop);
m=max(final_fitness);
result=unique(pop(final_fitness==m,:),'rows');
disp("Result - Final Lending Decision");
disp(result);
disp(["Result Fitness",m]);
disp(["Total Loan Amount",Total_Loan(result)]);
disp(["Total Loan Revenue", Total_Loan_Revenue(result)]);

plot(1:gens+1,avg_fitness,'b--o',1:gens+1,max_fitness,'r-*');
legend('Avg-Fitness','Max-Fitness',"Location","southeast");

toc