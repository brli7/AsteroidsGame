class Star {
  private int myX, myY, myColor;
  
  public Star() {
    myX = (int)(Math.random()*800);
    myY = (int)(Math.random()*800);
    myColor = (int)(Math.random()*255)+1;
  }
  
  public void show() {
    fill(myColor);
    noStroke();
    ellipse(myX, myY, 2, 2);
  }
}
