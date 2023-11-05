syms n
cn = 2/n;
tot = 5;
cont = 1;

for i=-tot:tot
    try
        cn1(cont) = double(subs(cn,n,i));
    catch
        cn1(cont) = 0;
    end
    cont = cont +1;
end