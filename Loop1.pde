import processing.sound.*;
import processing.video.*;
import gifAnimation.*;

PImage[] animation;
Gif loopingGif;
Gif nonLoopingGif;
boolean pause = false;

Movie movie;
Movie movie2;

SoundFile sample;
BeatDetector beatDetector;

int rectWidth;
int index;

float gifX;
float gifY;

void setup() {
  fullScreen(P2D, SPAN);
  size(560, 406);
  background(0);

  movie = new Movie(this, "scene1.mp4");
  movie.loop();

  movie2 = new Movie(this, "scene4.mp4");

  sample = new SoundFile(this, "sound1.wav");
  sample.loop();

  loopingGif = new Gif(this, "ship.gif");
  loopingGif.loop();

  frameRate(100);

  beatDetector = new BeatDetector(this);
  beatDetector.input(sample);

  gifX = width;
  gifY = height / 2 - loopingGif.height / 2;
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  blendMode(DIFFERENCE);
  background(200, 150, 100);
  rectColor();

  image(movie, 0, 0, width, height);

  gifY = constrain(mouseY - loopingGif.height / 2, 0, height - loopingGif.height);

  gifX -= 2;  

  if (gifX + loopingGif.width / 2 < 0) {
    gifX = width + loopingGif.width / 2; 
  }

  image(loopingGif, gifX - loopingGif.width / 2, gifY);
}

void keyPressed() {
  if (keyCode == 49) {
    movie.stop();
    movie = new Movie(this, "scene1.mp4");
    movie.loop();
  } else if (keyCode == 50 ) {
    movie.stop();
    movie = new Movie(this, "scene2.mp4");
    movie.loop();
  } else if (keyCode == 51 ) {
    movie.stop();
    movie = new Movie(this, "scene1.mp4");
    movie.loop();
  } else if (keyCode == 52 ) {
    movie.stop();
    movie = new Movie(this, "scene1.mp4");
    movie.loop();
  } else if (keyCode == 53 ) {
    movie.stop();
    movie = new Movie(this, "scene1.mp4");
    movie.loop();
  }

  if (key == ' ') {
    if (pause) {
      nonLoopingGif.play();
      loopingGif.play();
      pause = false;
    } else {
      nonLoopingGif.pause();
      loopingGif.pause();
      pause = true;
    }
  }
}

void rectColor() {
  
}
