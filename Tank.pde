class Tank {
  int xpos;
  int ypos;
  int angle;
  int power;

  Tank(int initialXpos, int initialYpos) {
    xpos = initialXpos;
    ypos = initialYpos;
    angle = 45;
    power = 60;
  }

  // draw the tank at its current position
  void display() {
    fill(255);

    noStroke();
    arc(xpos, ypos - 20, 10, 10, PI, TWO_PI);

    stroke(255);

    line(xpos, ypos, xpos, ypos - 20);
    line(xpos - 10, ypos - 20, xpos + 10, ypos - 20);

    pushMatrix();
    translate(xpos, ypos - 20);
    rotate(radians(angle - 90));
    line(0, 0, 15, 0);
    popMatrix();

    fill(255,255,255);

    textAlign(LEFT);
    textFont(hudFont);
    text("Angle: " + (-angle + 90), 5, 15);
    text("Power: " + power, 5, 25);
  }

  void barrelUp() {
    if (angle > -90) {
      angle--;
    }
  }

  void barrelDown() {
    if (angle < 90) {
      angle++;
    }
  }

  void powerUp() {
    if (power < 100) {
      power++;
    }
  }
  
  void powerDown() {
    if (power > 0) {
      power--;
    }
  }
    
  void fire() {
    int xbarrel = (int) (cos(radians(angle - 90)) * 15 + xpos);
    int ybarrel = (int) (sin(radians(angle - 90)) * 15 + ypos - 20);

    myRounds.add(new Round(xbarrel, ybarrel, angle, power));
  }
}

