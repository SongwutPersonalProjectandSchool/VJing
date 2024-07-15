/*
* Demonstrates the use of the GifAnimation library.
* the left animation is looping, the one in the middle 
* plays once on mouse click and the one in the right
* is a PImage array. 
* the first two pause if you hit the spacebar.
*/

import gifAnimation.*;

PImage[] animation;
Gif loopingGif;
Gif nonLoopingGif;
boolean pause = false;

int rectWidth;
int index;

public void setup() {
  size(800, 450);
  frameRate(100);
  
  println("gifAnimation " + Gif.version());
  
  loopingGif = new Gif(this, "undertale1.gif");
  loopingGif.loop();
  nonLoopingGif = new Gif(this, "undertale1.gif");
  nonLoopingGif.play();
  nonLoopingGif.ignoreRepeat();
  animation = Gif.getPImages(this, "undertale1.gif");
  
  noStroke();
  background(0);
  rectWidth = width/4;
  index = 10;
}

void draw() {
  
  background(127,mouseX,mouseY);
  rectColor();
  image(loopingGif, 100 ,100 , mouseX , 100);
  image(nonLoopingGif, 300, 250, 250, mouseY);
  image(animation[(int) (animation.length / (float) (width) * mouseX)], width - 10 - animation[0].width, height / 2 - animation[0].height / 2);
}

void mousePressed() {
  nonLoopingGif.play();
}

void keyPressed() {
  if (key == ' ') {
    if (pause) {
      nonLoopingGif.play();
      loopingGif.play();
      pause = false;
    } 
    else {
      nonLoopingGif.pause();
      loopingGif.pause();
      pause = true;
    }
  }
    int keyIndex = -1;
  if (key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
  if (keyIndex == -1) {
    // If it's not a letter key, clear the screen
    background(0);
  } else { 
    // It's a letter key, fill a rectangle
   index =keyIndex;
  }
}

void rectColor(){ fill(millis() % 255);
    float x = map(index, 0, 25, 0, width - rectWidth);
    rect(x, 0, rectWidth, height);
  }
