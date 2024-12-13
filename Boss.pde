class Boss extends Spaceship {
  
  public Boss() {
    myCenterX = Math.random()*1200;
    myCenterY = Math.random()*800;
    myPointDirection = (Math.atan((myCenterY - ship.getY())/(myCenterX-ship.getX())));
    myXspeed = Math.sin(myPointDirection);
    myYspeed = Math.cos(myPointDirection);
  }
  
  public void show() {
    fill(175);
    ellipse((float)myCenterX,(float)myCenterY, 100,100);
    fill(100);
    ellipse((float)myCenterX,(float)myCenterY+50, 200,80);
  }
  
  public void move() {
    myPointDirection = (Math.atan((myCenterY - ship.getY())/(myCenterX-ship.getX())));
    if(myCenterX >= ship.getX()) {
      myPointDirection = Math.PI + (Math.atan((myCenterY - ship.getY())/(myCenterX-ship.getX())));
    }
    
    myXspeed = Math.cos(myPointDirection);    
    myYspeed = Math.sin(myPointDirection); 
    
    myCenterX += myXspeed;    
    myCenterY += myYspeed; 
  }
  
  public double getX() {
    return myCenterX;
  }
  public double getY() {
    return myCenterY;
  }
  public double getDirection() {
    return myPointDirection;
  }
  public double getXspeed() {
    return myXspeed;
  }
  public double getYspeed() {
    return myYspeed;
  }
}


