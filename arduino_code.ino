int val1 = 0;
int val2 = 0;
int val3 = 0;
int inByte = 0;

void setup() {
  Serial.begin(9600);
  while (!Serial) {}
  establishContact();
}

void loop() {
  
  if (Serial.available() > 0) {
    inByte = Serial.read();
    val1 = analogRead(A2)/4;
    delay(20);
    val2 = analogRead(A1)/4;
    val3 = analogRead(A0)/4;
    Serial.write(val1);
    Serial.write(val2);
    Serial.write(val3);
 
  }

}

void establishContact(){

  while(Serial.available() <= 0){
    Serial.print('A');
    delay(300);
  }

}
