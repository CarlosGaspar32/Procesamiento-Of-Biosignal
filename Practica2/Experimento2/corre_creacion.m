function Y = corre_creacion(x,h)
    % Calcula la correlación discreta de dos vectores x y h
    Lx = length(x);
    Lh = length(h);
   
    h = fliplr(h);
    Ly=Lx+Lh-1;

    Y=zeros(1, Ly);
    indice=0;
    aux=0;

    for n=1:Ly
        for k=1:Lx
            indice=n-k+1;

            if indice>0 && indice<=Lh
                aux=h(indice);
            else
                aux=0;
            end
            Y(n)=Y(n)+x(k)*aux;          
        end
    end
end