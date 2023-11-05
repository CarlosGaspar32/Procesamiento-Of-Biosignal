
function Y = convol_creacion(x,h)
    % Calcula la convolución discreta de dos vectores x y h
    Lx=length(x);
    Lh=length(h);

    Ly=Lx+Lh-1;

    Y=zeros(1,Ly);
    indice=0;
    aux=0;

    for n=0:Ly-1
        for k=0:Lx-1
            indice=n-k;

            if indice>=0 && indice<Lh
               aux=h(indice+1);
            else
                aux=0;
            end

            Y(n+1)=Y(n+1)+x(k+1)*aux;
        end
     end
end

x= 1;
