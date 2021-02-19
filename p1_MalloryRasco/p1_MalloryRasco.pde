import controlP5.*;

ControlP5 cp5;

Button[] digits = new Button[10];
int[] buttonDigitSize = {50,50};

void setup() {
  size(500, 700);
  background(0);
  
  cp5 = new ControlP5(this);
}

void draw() {
  
  stroke(255);
  line(0,50,500,50);
  line(0,150,500,150);
  
  fill(255);
  //power
  rect(50,175,400,50);
  
  //number pad
  rect(25,250,450,300);
  stroke(0);
  line(175,250,175,550);
  line(325,250,325,550);
  line(25,325,475,325);
  line(25,400,475,400);
  line(25,475,475,475);
  
  //timer
  rect(25,600,125,75);
  //start
  rect(162,575,175,100);
  //cancel
  rect(350,600,125,75);
  
}
