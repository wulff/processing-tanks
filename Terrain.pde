class Terrain {
  int[] terrain;
  color[] palette;

  Terrain() {
    int factor = -1;

    terrain = new int[WIDTH];
    palette = new color[WIDTH];

    terrain[0] = 100 + (int) random(HEIGHT / 5);

    for (int i = 1; i < WIDTH; i++) {
      if (random(10) > 9) {
        factor = - factor;
      }

      terrain[i] = terrain[i-1] + factor;

      int adjust = (int) random(32);
      palette[i] = color(2 * adjust, 128 + adjust, 0);
    }
  }

  void display() {
    for (int i = 0; i < WIDTH; i++) {
      stroke(palette[i]);
      line(i, HEIGHT, i, HEIGHT - terrain[i]);
    }
  }

  int elevation(int position) {
    if (position >= 0 && position <= WIDTH - 1) {
      return terrain[position];
    }
    return -1;
  }

  void deform(int position, float vy) {
    if (position > WIDTH - 1 || position < 0) {
      return;
    }

    int velocity = (int) abs(vy);
    int craterSize = velocity * 10;

    int center = terrain[position];

    for (int i = 0; i < craterSize; i++) {
      int deformation = (int) sqrt(pow(craterSize, 2) - pow(i, 2));
      int newElevation = center - deformation;

      if (position + i < WIDTH - 1 && newElevation < terrain[position + i]) {
        terrain[position + i] = newElevation;
      }
      if (position - i > 0 && newElevation < terrain[position - i]) {
        terrain[position - i] = newElevation;
      }
    }
  }
}

