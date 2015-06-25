const int PIN_BUTTON = 7;
const int PIN_LED = 13;
const int BAUD_RATE = 9600;
const char PAYLOAD = 'A';
const int MIN_TIME = 200;

int button_state = 0;
unsigned long time_last = 0;
unsigned long time_curr = 0;

void setup() {
  pinMode(PIN_LED, OUTPUT);
  pinMode(PIN_BUTTON, INPUT);
  Serial.begin(BAUD_RATE);
}

void loop() {
  button_state = digitalRead(PIN_BUTTON);


  // button press
  if(button_state == HIGH) {
    // quick debouncer    
    time_curr = millis();


    if( time_curr - time_last > MIN_TIME ) {
      time_last = time_curr;
      digitalWrite(PIN_LED, HIGH);
      Serial.write(PAYLOAD);
    }
  }


  // button resting state
  else {
    digitalWrite(PIN_LED, LOW);
  }
}