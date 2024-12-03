class Asteroid extends Floater {
  private double rotateSpeed;
  private int radius;
  public Asteroid() {
    radius = (int)(Math.random()*40)+30;
    corners = 5;
    xCorners = new int[5];
    xCorners[0] = (int)(Math.cos(2*(Math.PI)/5)*radius);
    xCorners[1] = (int)(Math.cos(4*(Math.PI)/5)*radius);
    xCorners[2] = (int)(Math.cos(6*(Math.PI)/5)*radius);
    xCorners[3] = (int)(Math.cos(8*(Math.PI)/5)*radius);
    xCorners[4] = (int)(Math.cos(10*(Math.PI)/5)*radius);
    yCorners = new int[5];
    yCorners[0] = (int)(Math.sin(2*(Math.PI)/5)*radius);
    yCorners[1] = (int)(Math.sin(4*(Math.PI)/5)*radius);
    yCorners[2] = (int)(Math.sin(6*(Math.PI)/5)*radius);
    yCorners[3] = (int)(Math.sin(8*(Math.PI)/5)*radius);
    yCorners[4] = (int)(Math.sin(10*(Math.PI)/5)*radius);
    myColor = (int)(Math.random()*40)+40;
    myCenterX = Math.random()*1280;
    myCenterY = Math.random()*1024;
    myXspeed = (Math.random()*5)-2;
    myYspeed = (Math.random()*5)-2;
    myPointDirection = 45;
    rotateSpeed = (Math.random()*11)-5;
    
  }

  public void move() {
    super.move();
    myPointDirection += rotateSpeed;
  }
}
