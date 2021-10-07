function [a,b]=crossover(x,y,crossover_probability)
    l=length(x);
    r=rand();
    c1=[];
    c2=[];
    
    if r<=crossover_probability
        alpha=randi(l);
        c1=[x(1:alpha) y(alpha+1:end)];
        c2=[y(1:alpha) x(alpha+1:end)];
    else
        c1=x;
        c2=y;
    end
    
    a=c1;
    b=c2;
end