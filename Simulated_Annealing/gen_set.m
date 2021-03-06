function [set_bin,set_dec]=gen_set(number_of_solutions)
    i=0;
    set_bin=[];
    set_dec=[];
    while i<number_of_solutions
        k=randi(2^10-1);
        bin_k=dec2bin(k,10)-'0';
        x=cast(bin_k,'double');
        if ismember(k,set_dec)==0 && GAMCC(x)==1
            set_dec(end+1,:)=k;
            set_bin(end+1,:)=x;
            i=i+1;
        end
        %disp(set)
    end
end