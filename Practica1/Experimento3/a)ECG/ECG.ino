int ECG[]= {109,109,109,109,109,109,110,110,110,110,111,112,114,116,120,123,128,132,136,140,145,149,153,158,162,165,167,168,167,164,161,156,152,147,143,138,133,129,124,120,117,114,112,111,110,110,110,110,110,110,110,110,109,109,109,109,109,108,107,103,98,91,85,82,84,93,109,129,153,178,203,226,244,254,255,244,222,194,160,124,89,55,28,8,0,5,20,41,63,83,96,104,108,109,109,109,109,109,110,110,110,110,110,110,110,110,110,110,111,111,111,111,111,111,111,111,111,111,111,112,112,112,112,112,113,114,115,117,118,120,123,125,127,129,131,133,135,137,139,140,140,139,138,137,134,132,130,128,126,123,121,119,117,115,114,112,112,111,110,110,110,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109
};
int fs = 200;
float ts = 1/fs;

void setup() {
  pinMode(3,OUTPUT);

}

void loop() {
  for(int i=0;i<200;i++){
    analogWrite(3,ECG[i]);
    delay(5);
  }
}