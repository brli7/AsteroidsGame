Spaceship ship = new Spaceship();
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
Star[] stars = new Star[500];
boolean acceleration, rotateLeft, rotateRight = false;

public void setup() {
  size(1200,800);
  //fullScreen();
  background(0);
  for(int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  for(int i = 0; i < 15; i++) {
    asteroids.add(new Asteroid());
  }
  ship.center();
  shipX = width/2;
  shipY = height/2;
}

public void draw() {
  background(0);
  for(int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
  for(int i = 0; i < asteroids.size(); i++) {
    asteroids.get(i).move();
    asteroids.get(i).show(255);
    if(dist((float)asteroids.get(i).getX(), (float)asteroids.get(i).getY(), (float)ship.getX(), (float)ship.getY()) < asteroids.get(i).getRadius()) {
      asteroids.remove(i);
      i--;
    }
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
  ship.show(255);
  
}

public void keyPressed() {
  if(key == 'a' || key == 'A') {
    rotateLeft = true;
  }
  if(key == 'd' || key == 'D') {
    rotateRight = true;
  }
  if(key == 'w' || key == 'W') {
    acceleration = true;
  }
  if(key == 'q' || key == 'Q') {
    ship.teleport();
  }
  if(key == 'e' || key == 'E') {
    if(asteroids.size() > 0) {
      asteroids.remove(asteroids.size()-1);
    }
  }
  if(key == 'r' || key == 'R') {
    asteroids.add(new Asteroid());
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
