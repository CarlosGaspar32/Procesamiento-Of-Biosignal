#include "Antirrebotes.h"
#include <Arduino.h>

Antirrebotes::Antirrebotes(int pin) {
    _pin = pin;
    pinMode(_pin, INPUT);
    _estadoBoton = LOW;
    _estadoAnterior = HIGH;
    _tiempoAnterior = 0;
}

bool Antirrebotes::estadoBoton() {
    int lecturaBoton = digitalRead(_pin);

    if (lecturaBoton != _estadoAnterior) {
        _tiempoAnterior = millis();
    }

    if (millis() - _tiempoAnterior > _intervaloDebounce) {
        if (lecturaBoton != _estadoBoton) {
            _estadoBoton = lecturaBoton;
            if (_estadoBoton == LOW) {
                return true; // El botón ha sido presionado
            }
        }
    }

    _estadoAnterior = lecturaBoton;
    return false; // El botón no ha sido presionado
}
