import controlP5.*;
import processing.sound.*;

ControlP5 cp5;
SoundFile buttonBeep;
SoundFile endBeep;


//variables
Button[] digits = new Button[10];

PFont font;

int[] time = {-1,-1,-1,-1};
boolean countdown = false;
boolean endDisplay = false;
float lasttimecheck;
float timeinterval;
int sec;


void setup() {
  size(500, 700);
  background(0);
  
  cp5 = new ControlP5(this);
  
  buttonBeep = new SoundFile(this, "buttonBeep.wav");
  endBeep = new SoundFile(this, "endBeep.wav");
  
  fill(255);
  font=createFont("Times New Roman",30);
  
  Slider powerS = (cp5.addSlider("power").setSize(400,35).setRange(0,100).setNumberOfTickMarks(11).setValue(100).setPosition(50,195).setFont(font))
    .setColorBackground(color(50)).setColorForeground(color(85)).setColorActive(color(100));
  cp5.getController("power").getCaptionLabel().setVisible(false);
  
  PImage img = loadImage("lightning.jpg");
  image(img, 0, 180);
  
  font = createFont("Times New Roman", 50);
  
  int i = 1;
  for(int y = 250; y<=404; y=y+77) {
    for(int x = 25; x<=329; x = x+152) {
      digits[i] = (cp5.addButton(String.valueOf(i)).setSize(150,75).setPosition(x,y).setFont(font))
        .setColorBackground(color(25)).setColorForeground(color(150)).setColorActive(color(100));
        i++;
    }
  }  
  digits[0] = (cp5.addButton("0").setSize(150,75).setPosition(177,481).setFont(font))
    .setColorBackground(color(25)).setColorForeground(color(150)).setColorActive(color(100));
  
  PImage[] backspace = {loadImage("back25.jpg"), loadImage("back150.JPG"), loadImage("back100.JPG")};
  Button back = cp5.addButton("back").setImages(backspace).setPosition(329,481).updateSize();
  
  PImage[] hourglassI = {loadImage("timer25.jpg"), loadImage("timer150.jpg"), loadImage("timer100.jpg")};
  Button hourglassB = cp5.addButton("timer").setImages(hourglassI).setSize(125,75).updateSize().setPosition(25,610).updateSize();
  
  PImage[] powerI = {loadImage("power25.jpg"), loadImage("power150.jpg"), loadImage("power100.jpg")};
  Button start = cp5.addButton("start").setImages(powerI).setSize(175,90).setPosition(162,595).updateSize(); 
    //.setColorBackground(color(25)).setColorForeground(color(150)).setColorActive(color(100));
  
  PImage[] stop = {loadImage("cancel25.jpg"), loadImage("cancel150.jpg"), loadImage("cancel100.jpg")};
  Button cancel = cp5.addButton("cancel").setImages(stop).setSize(125,75).setPosition(350,610).updateSize();

}

void draw() {
  stroke(0);
  fill(00);
  
  //reset date/time and timer screens
  rect(0,0,500,48);
  rect(120,62,500,76);
  
  stroke(255);
  fill(255);
  
  //decorations below date and timer
  line(0,60,500,60);
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
  
  //decorations around bottom
  //timer
  line(23,608,150,608);
  line(23,685,150,685);
  line(23,608,23,683);
  line(150,608,150,683);
  //cancel
  line(348,608,475,608);
  line(348,685,475,685);
  line(348,608,348,685);
  line(475,608,475,685);
  //power
  line(160,593,337,593);
  line(160,685,337,685);
  line(160,593,160,685);
  line(337,593,337,685);
  
  
  //if timer is counting down
  if(countdown == true) {
    if(time[0] > 0 || time[1] > 0 || time[2] > 0 || time[3] > 0) {
      countdownCal();
    }
    else {
      for(int g = 0; g<4; g++) {
        time[g] = -1;
      }
      
      endDisplay = true;
      lasttimecheck = millis();
      endBeep.play();
      endDisplayCal();  
      countdown = false;
    }
  }
  
  if(endDisplay == true) {
    endDisplayCal();
  }
  
  
  font=createFont("Times New Roman",45);
  textFont(font);
  
  int m = month();
  int d = day();
  int y = year();
  int h = hour();
  int min = minute();
  
  String date = String.valueOf(m) + " / " + String.valueOf(d) + " / " + String.valueOf(y);
  String timeC;
  String minS = String.valueOf(min);
  
  //create correct standardized time
  if(min<=9) {
    minS = "0" + minS;
  }
  
  if(h<=11){
    if(h==0) {
      timeC = "12:" + minS + "  AM";
    } else {
      timeC = String.valueOf(h) + ":" + minS + "  AM";
    }
  } else {
    if(h==12) {
      timeC = String.valueOf(h) + ":" + minS + "  PM";
    } else {
        timeC = String.valueOf(h-12) + ":" + minS + "  PM";
    }
  }
  

  //display date and time
  text(date,30,45);
  text(timeC,300,45);
  
  font = createFont("Times New Roman",35);
  textFont(font);
  //display titles
  text("Power",50,185);
  text("Timer",25,600);
  text("Start",215,587);
  text("Cancel",380,600);
    
  
  font = createFont("Times New Roman", 85);
  textFont(font);
  
  //print to timer screen
  if(time[0] >= 0) {   
  
    text(":",250,125);
    int coordinate = 350;
    for(int data = 3; data>=0; data--) {
    
      if(time[data]>=0) {
        text(String.valueOf(time[data]),coordinate,135); 
        
        coordinate = coordinate - 70; 
      }        
    }
  }
  else {
    if(endDisplay == true) {
      text("End",150,135);
    }
    else {
      text("Hello",150,135);
    }
  }
  
}



void controlEvent(ControlEvent theEvent) {
  buttonBeep.cue(.33);
  buttonBeep.amp(1);
  buttonBeep.play();
  
  switch(theEvent.getController().getName()) {
    case "1": case "2": case "3": case "4": case "5": case "6": case "7": case "8": case "9": case "0":
      int t = 0;
      while(time[t] >= 0 && t <= 3) {
        t++;
      }
      time[t] = int(theEvent.getController().getName());  
    break;
    
    case "back":
      for(int j = 0; j<5; j++) {
        if(j == 4) {
          time[3] = -1;
        }
        else {
          if(time[j] < 0 || j == 4) {
          time[j-1] = -1; }
        }
      }
    break;
    
    case "timer":
      stroke(255);
      font=createFont("Times New Roman",25);
      textFont(font);
  
      text("TIMER",30,140);
      
      stroke(0);
      fill(0);
      rect(120,62,500,76);
    break;
    
    case "start":
      lasttimecheck = millis();
      countdown = true;
      
      sec = 0;
      while(sec<3 && time[sec+1] >= 0) {
        sec++;
      }
      
      if(sec == 3) {
        if(time[sec] < 0) {
          sec--;
        }
      }      
    break;
    
    case "cancel":
      stroke(0);
      fill(0);
      rect(0,52,500,96);
      
      endBeep.stop();
      countdown = false;
      endDisplay = false;
      
      for(int r=0; r<4; r++) {
        time[r]=-1;
      }
    break;
  }  
}


void countdownCal() {
  
  timeinterval = 1000;
      
  if(millis() > lasttimecheck + timeinterval) {
    lasttimecheck = millis();
           
    if(time[sec] > 0) {
      time[sec]--;
    }
    else {
      if(time[sec-1] > 0) {
        time[sec-1]--;
        time[sec] = 9;
      }
      else {
        if(time[sec-2] > 0) {
          time[sec-2]--;
          time[sec-1] = 5;
          time[sec] = 9;
        }
        else {
          if(time[sec-3] > 0) {
            time[sec-3]--;
            time[sec-2] = 9;
            time[sec-1] = 5;
            time[sec] = 9;
          }
        }
      }
    }
  } 
}

void endDisplayCal() {
  timeinterval = (endBeep.duration())*1000;
  
  if(millis() > lasttimecheck + timeinterval) {
    endDisplay = false;
  }
  
}
