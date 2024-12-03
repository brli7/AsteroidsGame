class Spaceship extends Floater {
  private int maxSpeed = 20;
  public Spaceship() {
    corners = 4;
    xCorners = new int[4];
    xCorners[0] = 20;
    xCorners[1] = -20;
    xCorners[2] = -8;
    xCorners[3] = -20;
    yCorners = new int[4];
    yCorners[0] = 0;
    yCorners[1] = 15;
    yCorners[2] = 0;
    yCorners[3] = -15;
    myColor = 75;
    myCenterX = width/2;
    myCenterY = height/2;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }
  public void teleport()  {
    myCenterX = Math.random()*800;
    myCenterY = Math.random()*800;
    myXspeed = myYspeed = 0;
    myPointDirection = Math.random()*360;
  }
  public void center() {
    myCenterX = width/2;
    myCenterY = height/2;
  }
  public void shoot() {
    
  }
  public void darken() {
    if(myColor > 76) {
      myColor -= 5;
    }
  }
  public void move() {
    if(myXspeed < maxSpeed && myYspeed < maxSpeed && myXspeed > maxSpeed*-1 && myYspeed > maxSpeed*-1) {
      super.move();
    }
    if(myXspeed > maxSpeed) {
      myXspeed--;
    }
    if(myXspeed < maxSpeed*-1) {
      myXspeed++;
    }
    if(myYspeed > maxSpeed) {
      myYspeed--;
    }
    if(myYspeed < maxSpeed*-1) {
      myYspeed++;
    }
  }
}
