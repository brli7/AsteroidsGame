Spaceship ship = new Spaceship();
Star[] stars = new Star[250];
boolean acceleration, rotateLeft, rotateRight = false;


public void setup() {
  size(1000,800);
  //fullScreen();
  background(0);
  for(int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

public void draw() {
  background(0);
  for(int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
  if(acceleration) {
    ship.accelerate(0.1);
  } else {
    ship.darken();
  }
  if(rotateLeft) {
    ship.turn(-5);
  }
  if(rotateRight) {
    ship.turn(5);
  }
  ship.move();
  ship.show();
}

public void keyPressed() {
  if(key == 'a') {
    rotateLeft = true;
  }
  if(key == 'd') {
    rotateRight = true;
  }
  if(key == 'w') {
    acceleration = true;
  }
  if(key == 'q') {
    ship.teleport();
  }
}

public void keyReleased() {
  if(key == 'a') {
    rotateLeft = false;
  }
  if(key == 'd') {
    rotateRight = false;
  }
  if(key == 'w') {
    acceleration = false;
  }
}
