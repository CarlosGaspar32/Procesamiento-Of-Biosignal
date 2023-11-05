function [vect_freq,esp_amp,esp_fase] = espectros_fourier(y,Fs)
    L=length(y);
    vect_freq=linspace(0,1,round(L/2)+1)*(Fs/2);
    
    Y=fft(y);
    Y_abs=abs(Y/L);
    Y_fase=angle(Y);
    
    esp_amp=2*Y_abs(1:round(L/2)+1);
    esp_fase=Y_fase(1:round(L/2)+1);

end

