close;
Arritmia = load("I01m.mat")
Arritmia = Arritmia.val;
fs = 257;
ts = 1/fs;
a = 0;
while(1)
    t = 0:ts:10-ts;
    limitefinal = 5;
    limiteinicial = 0;
    for i=1:9:2570
        tic;
    
        plot(t(1:i),Arritmia(1:i))
        if t(i) < limitefinal
            axis([limiteinicial limitefinal 984 1499])
        else
            limitefinal = limitefinal + 5;
            limiteinicial = limiteinicial + 5;
        end
        losttime = toc;
        pause(ts)
        if a == 2
            break;
        end
    end
end