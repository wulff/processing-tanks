class Round {
  float posx;
  float posy;
  float vx;
  float vy;
  float ay;

  Round(int initx, int inity, int angle, float power) {
    vx = cos(radians(angle - 90)) * (power / 20);
    vy = - sin(radians(angle - 90)) * (power / 20);
    posx = initx;
    posy = inity;
  }

  void move() {
    vy -= 0.02;

    posx += vx;
    posy -= vy;
  }

  boolean finished() {
    if (posy > HEIGHT) {
      return true;
    }

    int elevation = HEIGHT - myTerrain.elevation((int) posx);
    if (posy > elevation) {
      myAudio.blast();
      myTerrain.deform((int) posx, vy);
      return true;
    }
    else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(255, 0, 0);
    ellipse(posx, posy, 3, 3);

    if (posy < 0) {
      stroke(255, 0, 0);
      line(posx, 0, posx, 4);
    }
  }
}

