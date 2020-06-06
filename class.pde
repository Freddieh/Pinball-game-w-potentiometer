//line val
float xP;
float yP;
float lngth;

//ball val
float xB;
float yB;
float ballSpdX=3;
float ballSpdY=3;
float radius = 2;

class blk {

  blk(float tempX, float tempY, float tempLength) {
    xP = tempX;
    yP = tempY;
    lngth = tempLength;
  }

  void drawLine() {
    strokeCap(SQUARE);
    strokeWeight(1);
    stroke(255);
    line(xP, yP+400, xP+30+lngth, yP+400);
  }
}

class bl {

  bl(float tempXB, float tempYB) {
    xB = tempXB;
    yB = tempYB;
    //ballSpdX = tempSPD;
    //ballSpdY = tempSPD;
  }
  
    
    void drawBall() {
      noStroke();
      fill(255);
      circle(xB, yB, radius);
    }

    void ballMove() {
      //ballSpdX = tempSPD;
      //ballSpdY = tempSPD; 
      xB += ballSpdX;
      yB -= ballSpdY;

      if (xB > width-radius/2 || xB < 0+radius/2) {
        ballSpdX = -ballSpdX;
      }

      if (yB < 0+radius/2) {
        ballSpdY = -ballSpdY;
      }
    }

    void reflect() {
      if (yB+radius/2 > yP+400-3 && xB > xP-30 && xB < xP+30+lngth) {
        if(yB+radius/2 < yP+400){
        ballSpdY = -ballSpdY;        
        }
      }
    }
  
}
