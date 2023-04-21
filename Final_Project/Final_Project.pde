
Player individual;

void setup() {
  individual = new Player();
  size(1000, 800);
  frameRate(60);
}

void draw() {
  background(0);
  individual.update();
}
