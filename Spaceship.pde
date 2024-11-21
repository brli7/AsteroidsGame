class Spaceship extends Floater {
  public Spaceship() {
    corners = 4;
    xCorners = new int[4];
    xCorners[0] = 15;
    xCorners[1] = -15;
    xCorners[2] = -8;
    xCorners[3] = -15;
    yCorners = new int[4];
    yCorners[0] = 0;
    yCorners[1] = 10;
    yCorners[2] = 0;
    yCorners[3] = -10;
    myColor = 50;
    myCenterX = 400;
    myCenterY = 400;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }
  public void teleport()  {
    myCenterX = Math.random()*800;
    myCenterY = Math.random()*800;
    myXspeed = myYspeed = 0;
    myPointDirection = (int)(Math.random()*360);
  }
}

