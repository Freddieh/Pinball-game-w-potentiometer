//arduino
import processing.serial.*;
Serial myPort1;
int[] serialInArray = new int[3];
int serialCount = 0;
boolean firstContact = false;

//block
float xpos, ypos;
float difficulty=0;
blk block;


//ball
float xBall, yBall;
float ballSP;
bl ball;

void setup() {
  
  printArray(Serial.list());
  String portName = Serial.list()[6];
  myPort1 = new Serial(this, portName, 9600);
  
  size(600, 600);
  background(0);
  smooth();
  frameRate(60);
  
  ball = new bl(width/2, 200); 

}

void draw(){
  println(myPort1.read());     
  
  noStroke();
  fill(0,50);
  rect(0, 0, width, height);
  
  
 
  block = new blk(xpos, ypos, difficulty);  
  block.drawLine();
  
    
  ball.drawBall();
  ball.ballMove();
  ball.reflect();
  
}




void serialEvent(Serial myPort){
  int inByte = myPort.read();

  if(firstContact == false){
    if(inByte == 'A'){
      myPort.clear();
      firstContact = true;
      myPort.write('A');
    } 
  } else {
    serialInArray[serialCount] = inByte;
    serialCount++;
    
    if(serialCount > 2){
      xpos = map(serialInArray [0], 0, 255, 600-30-difficulty, 0);
      ypos = map(serialInArray [1], 0, 255, 0, 200-3);
      difficulty = map(serialInArray [2], 0, 255, 0, 100);      
      
      println(xpos + "\t" + ypos + "\t" + difficulty);
      
      myPort.write('A');
      serialCount = 0;
    }
  }


}
