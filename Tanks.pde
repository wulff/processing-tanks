// Tanks
//
// 

// TODO: add random wind

import ddf.minim.*;

final int WIDTH = 640;
final int HEIGHT = 360;

final int TITLE = 1;
final int GAME = 2;

int mode;

PFont hudFont;
PFont tipFont;
PFont titleFont;

Minim minim;
Audio myAudio;
Tank myTank;
Terrain myTerrain;

ArrayList<Round> myRounds;

void setup() {
  minim = new Minim(this);

  size(WIDTH, HEIGHT);
  background(0, 0, 0);

  mode = TITLE;

  myAudio = new Audio();

  myTerrain = new Terrain();

  int elevation = myTerrain.elevation(50);
  myTank = new Tank(50, HEIGHT - elevation);

  myRounds = new ArrayList<Round>();

  hudFont = loadFont("AmericanTypewriter-12.vlw");
  tipFont = loadFont("AmericanTypewriter-36.vlw");
  titleFont = loadFont("AmericanTypewriter-172.vlw");
}

void draw() {
  switch (mode) {
    case TITLE:
      drawTitle();
      break;
    case GAME:
      drawGame();
      break;
  } 
}

void keyPressed() {
  switch (mode) {
    case TITLE:
      if (key == ' ') {
        mode = GAME;
      }
      break;
    case GAME:
      if (key == ' ') {
        myAudio.shot();
        myTank.fire();
      }
      break;
  } 
}

void drawTitle() {
  background(0, 0, 0);

  stroke(0);
  fill(255);

  textAlign(CENTER);

  textFont(titleFont);
  text("Tanks", 320, 180);

  textFont(tipFont);
  text("Press <space> to begin…", 320, 280);
}

void drawGame() {
  if (keyPressed) {
    if (keyCode == LEFT) {
      myTank.barrelUp();
    }
    if (keyCode == RIGHT) {
      myTank.barrelDown();
    }
    if (keyCode == UP) {
      myTank.powerUp();
    }
    if (keyCode == DOWN) {
      myTank.powerDown();
    }
  }

  background(0, 0, 0);

  myTerrain.display();
  myTank.display();
  
  for (int i = myRounds.size() - 1; i >= 0; i--) {
    Round round = myRounds.get(i);
    round.move();
    round.display();
    if (round.finished()) {
      myRounds.remove(i);
    }
  }
}

