import controlP5.*;

ControlP5 cp5;


//Button[] digits = new Button[10];
//int[] buttonDigitSize = {150,75};

void setup() {
  size(500, 700);
  background(0);
  
  cp5 = new ControlP5(this);
  
  fill(255);
  PFont font=createFont("Times New Roman",30);
  
  Slider powerS = (cp5.addSlider("").setSize(400,35).setRange(0,100).setValue(100).setPosition(50,195).setFont(font))
    .setColorBackground(color(50)).setColorForeground(color(85)).setColorActive(color(100));
  
  font = createFont("Times New Roman", 50);
  
  Button one = (cp5.addButton("1").setSize(150,75).setPosition(25,250).setFont(font))
    .setColorBackground(color(25)).setColorForeground(color(150)).setColorActive(color(100));
  Button two = cp5.addButton("2").setSize(150,75).setPosition(177,250).setFont(font);
  two.setColorBackground(color(25)).setColorForeground(color(150)).setColorActive(color(100));
  Button three = cp5.addButton("3").setSize(150,75).setPosition(329,250).setFont(font);
  three.setColorBackground(color(25)).setColorForeground(color(150)).setColorActive(color(100));
  Button four = cp5.addButton("4").setSize(150,75).setPosition(25,327).setFont(font);
  four.setColorBackground(color(25)).setColorForeground(color(150)).setColorActive(color(100));
  Button five = cp5.addButton("5").setSize(150,75).setPosition(177,327).setFont(font);
  five.setColorBackground(color(25)).setColorForeground(color(150)).setColorActive(color(100));
  Button six = cp5.addButton("6").setSize(150,75).setPosition(329,327).setFont(font);
  six.setColorBackground(color(25)).setColorForeground(color(150)).setColorActive(color(100));
  Button seven = cp5.addButton("7").setSize(150,75).setPosition(25,404).setFont(font);
  seven.setColorBackground(color(25)).setColorForeground(color(150)).setColorActive(color(100));
  Button eight = cp5.addButton("8").setSize(150,75).setPosition(177,404).setFont(font);
  eight.setColorBackground(color(25)).setColorForeground(color(150)).setColorActive(color(100));
  Button nine = cp5.addButton("9").setSize(150,75).setPosition(329,404).setFont(font);
  nine.setColorBackground(color(25)).setColorForeground(color(150)).setColorActive(color(100));
  Button zero = cp5.addButton("0").setSize(150,75).setPosition(177,481).setFont(font);
  zero.setColorBackground(color(25)).setColorForeground(color(150)).setColorActive(color(100));
  
  PImage[] backspace = {loadImage("back25.2.jpg"), loadImage("back150.JPG"), loadImage("back100.JPG")};
  Button back = cp5.addButton("Back").setImages(backspace).setPosition(329,481).updateSize();
  
  PImage hourglass = loadImage("timer.jpg");
  Button timer = cp5.addButton("Timer").setImage(hourglass).setSize(125,75).updateSize().setPosition(25,610).updateSize();
  
  PImage powerI = loadImage("power.jpg");
  Button start = cp5.addButton("Start").setImage(powerI).setSize(175,100).setPosition(162,595).updateSize();
  
  PImage stop = loadImage("cancel.jpg");
  Button cancel = cp5.addButton("Cancel").setImage(stop).setSize(125,75).setPosition(350,610).updateSize();
}

void draw() {
  stroke(0);
  fill(0);
  rect(0,0,500,48);
  
  stroke(255);
  fill(255);
  
  //decorations below date and timer
  line(0,50,500,50);
  line(0,150,500,150);
  
  //decorations through number pad
  //horizontal
  line(23,248,481,248);
  line(25,325,479,325);
  line(25,402,479,402);
  line(25,479,479,479);
  line(23,557,481,557);
  //vertical
  line(23,248,23,557);
  line(175,250,175,554);
  line(327,250,327,554);
  line(481,248,481,557);
  
  
  PFont font=createFont("Times New Roman",35);
  textFont(font);
  
  int m = month();
  int d = day();
  int y = year();
  int h = hour();
  int min = minute();
  
  String date = String.valueOf(m) + " / " + String.valueOf(d) + " / " + String.valueOf(y);
  String time;
  String minS = String.valueOf(min);
  
  //create correct time
  if(min<=9) {
    minS = "0" + minS;
  }
  
  if(h<=11){
    if(h==0) {
      time = "12:" + minS + "  AM";
    } else {
      time = String.valueOf(h) + ":" + minS + "  AM";
    }
  } else {
    if(h==12) {
      time = String.valueOf(h) + ":" + minS + "  PM";
    } else {
        time = String.valueOf(h-12) + ":" + minS + "  PM";
    }
  }
  

  //display date and time
  text(date,60,35);
  text(time,300,35);
  
  //display titles
  text("Power",50,185);
  text("Timer",25,600);
  text("Start",215,587);
  text("Cancel",380,600);
  
  font = createFont("Times New Roman", 75);
  textFont(font);
  text("Hello",160,125);
  
}
