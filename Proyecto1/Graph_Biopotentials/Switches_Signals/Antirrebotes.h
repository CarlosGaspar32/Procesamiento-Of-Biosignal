#ifndef Antirrebotes_h
#define Antirrebotes_h

class Antirrebotes {
public:
    Antirrebotes(int pin);
    bool estadoBoton();
    
private:
    int _pin;
    int _estadoBoton;
    int _estadoAnterior;
    unsigned long _tiempoAnterior;
    const long _intervaloDebounce = 50;
};

#endif
