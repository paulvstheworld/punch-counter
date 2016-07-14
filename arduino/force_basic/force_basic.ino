const int FLEXI_FORCE_PIN = A0; //analog pin 0
const int MIN_TIME_DIFF = 10;

unsigned long time_last = 0;
unsigned long time_curr = 0;

void setup(){
  Serial.begin(57600);
}

void loop(){
  time_curr = millis();

  if (time_curr - time_last > MIN_TIME_DIFF) {
    int flexi_force_reading = analogRead(FLEXI_FORCE_PIN); 
    Serial.write(flexi_force_reading/10);
    time_last = millis();
  }
}
