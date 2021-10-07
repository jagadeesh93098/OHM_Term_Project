function c=mutate(a,mutation_probability)
    r=rand();
    c=a;
    if r<=mutation_probability
        alpha=randi(10);
        if a(alpha)==1
            c(alpha)=0;
        else
            c(alpha)=1;
        end
    end
end