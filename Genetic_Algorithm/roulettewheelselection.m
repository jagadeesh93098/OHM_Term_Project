function index=roulettewheelselection(dist)
    p1=rand();
    p2=rand();
    s1=dist>p1;
    s2=dist>p2;
    index=zeros([1,2]);
    for i=1:length(dist)
        if sum(s1(1:i))==1
            index(1,1)=i;
            break
        end
    end
    for j=1:length(dist)
        if sum(s2(1:j)==1)
            index(1,2)=j;
            break
        end
    end
end