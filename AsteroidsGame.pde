Spaceship ship = new Spaceship();
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
Star[] stars = new Star[500];
boolean acceleration, rotateLeft, rotateRight = false;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Bullet> bossBullets = new ArrayList<Bullet>();
int health = 40;
int bossHealth = 50;
Boss bigboi = new Boss();

public void setup() {
  size(1200,800);
  ship.center();
  //fullScreen();
  background(0);
  for(int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  for(int i = 0; i < 15; i++) {
    asteroids.add(new Asteroid());
  }
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
      if(asteroids.get(i).getRadius() > 30) {
        asteroids.add(new Asteroid(asteroids.get(i)));
        asteroids.add(new Asteroid(asteroids.get(i)));
      }
      asteroids.remove(i);
      i--;
      health--;
    }
    for(int e = 0; e < bullets.size(); e++) {
      if(i >= 0 && dist((float)asteroids.get(i).getX(), (float)asteroids.get(i).getY(), (float)bullets.get(e).getX(), (float)bullets.get(e).getY()) < asteroids.get(i).getRadius()) {
        if(asteroids.get(i).getRadius() > 30) {
          asteroids.add(new Asteroid(asteroids.get(i)));
          asteroids.add(new Asteroid(asteroids.get(i)));
        }
        asteroids.remove(i);
        i--;
        bullets.remove(e);
        e--;
      }
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
  
  for(int i = 0; i < bullets.size(); i++) {
    if(dist((float)bullets.get(i).getX(), (float)bullets.get(i).getY(), (float)bigboi.getX(), (float)bigboi.getY()) < 100) {
      bullets.remove(i);
      i--;
      bossHealth--;
    }
  }
  
  for(int i = 0; i < bullets.size(); i++) {
    bullets.get(i).move();
    bullets.get(i).show();
    if(bullets.get(i).die()) {
      bullets.remove(i);
      i--;
    }
  }
  ship.move();
  ship.show(255);
  if(asteroids.size() == 0) {
    for(int i = 0; i < 15; i++) {
      asteroids.add(new Asteroid());
    }
  }
  
  bigboi.move();
  bigboi.show();
  
  if((int)(Math.random()*30) == 1) {
    bossBullets.add(new Bullet(bigboi));
  }
  
  for(int i = 0; i < bossBullets.size(); i++) {
    if(dist((float)bossBullets.get(i).getX(), (float)bossBullets.get(i).getY(), (float)ship.getX(), (float)ship.getY()) < 15){
      bossBullets.remove(i);
      i--;
      health--;
    }
  }
  
  for(int i = 0; i < bossBullets.size(); i++) {
    bossBullets.get(i).move();
    bossBullets.get(i).show();
    if(bossBullets.get(i).die()) {
      bossBullets.remove(i);
      i--;
    }
  }
  
  if(dist((float)ship.getX(), (float)ship.getY(), (float)bigboi.getX(), (float)bigboi.getY()) < 100) {
    health--;
  }
  
  stroke(255);
  strokeWeight(1);
  fill(150);
  quad(45,45 , 45,105 , 255,105 , 255,45);
  quad(45,115 , 45,175 , 255,175 , 255,115);
  fill(0,255,0);
  quad(50,50 , 50,100 , 50+(5*health),100 , 50+(5*health),50);
  fill(255,0,0);
  quad(50,120 , 50,170 , 50+(4*bossHealth),170 , 50+(4*bossHealth),120);
  
  fill(0);
  textSize(20);
  text("your health: " + health, 70,75);
  text("boss health: " + bossHealth, 70,145);

  if(health <= 0) {
    fill(0);
    quad(0,0 , width,0 , width,height , 0,height);
    fill(255);
    textSize(50);
    text("you died", 600,400);
    noLoop();
  }
  if(bossHealth <= 0) {
    fill(0);
    quad(0,0 , width,0 , width,height , 0,height);
    fill(255);
    textSize(50);
    text("you won", 600,400);
    noLoop();
  }
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
  if(key == ' ') {
    bullets.add(new Bullet(ship));
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

