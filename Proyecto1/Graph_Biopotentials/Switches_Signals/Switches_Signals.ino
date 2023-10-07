#include <Arduino.h>
#include "Antirrebotes.h"

Antirrebotes botonAntirrebotespin3(3); // Crea una instancia de la clase Antirrebotes para el pin 2
Antirrebotes botonAntirrebotespin4(4);
Antirrebotes botonAntirrebotespin5(5);

void setup() {
    Serial.begin(9600);
    Serial.println(0);
}

void loop() {
    if (botonAntirrebotespin3.estadoBoton()) {
        Serial.println('1');

    }

    if (botonAntirrebotespin4.estadoBoton()) {
        Serial.println('2');
    }
    
    if (botonAntirrebotespin5.estadoBoton()) {
        Serial.println('3');
    }
}
