class Bullet extends Floater {
  private boolean dead = false;
  private boolean isBoss = false;
  public Bullet(Spaceship leShip) {
    if(leShip == bigboi) {
      isBoss = true;
    }
    myCenterX = leShip.getX();
    myCenterY = leShip.getY();
    myXspeed = leShip.getXspeed();
    myYspeed = leShip.getYspeed();
    myPointDirection = leShip.getDirection();
    accelerate(10.0);
    if(isBoss) {
      myXspeed = bigboi.getXspeed() * 10;
      myYspeed = bigboi.getYspeed() * 10;
    }
  }
  
  public void show() {
    fill(0,255,0);
    if(isBoss) {
      fill(255,0,0);
    }
    noStroke();
    ellipse((float)myCenterX, (float)myCenterY, 10, 10);
  }
  
  public double getX() {
    return myCenterX;
  }
  
  public double getY() {
    return myCenterY;
  }
  
  public void move() {
    myCenterX += myXspeed;    
    myCenterY += myYspeed; 
   
    if(myCenterX >width) {     
       dead = true;
    } else if (myCenterX<0) {     
       dead = true;
    }    
    if(myCenterY >height) {    
       dead = true;
    } else if (myCenterY < 0) {     
       dead = true;
    }
    
  }
  
  public boolean die() {
    return dead;
  }
}


