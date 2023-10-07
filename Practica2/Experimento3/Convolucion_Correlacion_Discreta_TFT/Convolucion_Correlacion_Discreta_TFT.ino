#include <SPI.h>
#include <Adafruit_ILI9341.h>
#include <Adafruit_GFX.h>

#define TFT_DC 9
#define TFT_CS 10

Adafruit_ILI9341 tft = Adafruit_ILI9341(TFT_CS, TFT_DC);

//Convolucion
uint8_t x [] = {3,-2,-9,6};
uint8_t h [] = {1, 4, 1};

void setup() {
  tft.begin();
  tft.setRotation(0);
  tft.fillScreen(ILI9341_BLACK);
  tft.setTextColor(ILI9341_WHITE);
  tft.setTextSize(2);
  tft.setCursor(0,0);
  tft.print("CONVOLUCION:");
  tft.setCursor(0,150);
  tft.print("CORRELACION:");
}

void loop() {
  uint8_t Lx = sizeof(x);
  uint8_t Lh = sizeof(h);
  
  uint8_t Ly = Lx + Lh - 1;
  
  int8_t Y [Ly] = {};
  int8_t indice = 0;
  uint8_t aux = 0;
  uint8_t E = 0;
  

  for (uint8_t n=0;n<Ly;n++){
    for (uint8_t k=0;k<Lx;k++){
      indice = n - k;

      if (indice>=0 && indice<Lh){
        aux = h[indice];
      }else{
        aux = 0;
      }

      Y [n] = Y [n] + x[k] * aux;
      }
      tft.setTextColor(ILI9341_WHITE,ILI9341_RED);
      tft.setCursor(E,40);
      tft.print(Y[n]);
      E = E + 40;
      delay(10);
    }

//CORRELACION

  uint8_t x [] = {2,1,0,2};
  uint8_t h [] = {-1,0,2,-3};

  Lx = sizeof(x);
  Lh = sizeof(h);

  // Invierte el vector
  uint8_t inicio = 0;
  uint8_t fin = Lh - 1;
  while (inicio < fin) {
    // Intercambia los elementos en las posiciones inicio y fin
    uint8_t temp = h[inicio];
    h[inicio] = h[fin];
    h[fin] = temp;
    
    // Mueve los índices hacia el centro del vector
    inicio++;
    fin--;
  }
  
  Ly = Lx + Lh - 1;
  
  int8_t G [Ly] = {};
  indice = 0;
  aux = 0;
  E = 0;

  for (uint8_t n=0;n<Ly;n++){
    for (uint8_t k=0;k<Lx;k++){
      indice = n - k;

      if (indice>=0 && indice<Lh){
        aux = h[indice];
      }else{
        aux = 0;
      }

      G [n] = G [n] + x[k] * aux;
      }
      tft.setTextColor(ILI9341_WHITE,ILI9341_RED);
      tft.setCursor(E,200);
      tft.print(G[n]);
      E = E + 30;
      delay(10);
    }

    break;
  }
