class Star {
  private int myX, myY, myColor;
  
  public Star() {
    myX = (int)(Math.random()*width);
    myY = (int)(Math.random()*height);
    myColor = (int)(Math.random()*255)+1;
  }
  
  public void show() {
    fill(myColor);
    noStroke();
    ellipse(myX, myY, 2, 2);
  }
}
