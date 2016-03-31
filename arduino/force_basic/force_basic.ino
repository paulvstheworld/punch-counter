int flexiForcePin = A0; //analog pin 0

void setup() {
  Serial.begin(57600);
}

void loop() {
  int force_reading = analogRead(flexiForcePin);
  Serial.write(force_reading/10);
  delay(40); //just here to slow down the output for easier reading
}
