public class Button{
  private String text;
  private int x, y, w, h;//Dimension des Buttons
  private color orange, darkOrange, black, white, green, darkGreen;
  private boolean pressed = false;
  private ActionListener action;
  private boolean visible;
  
  public Button(String t){
    text = t;
    orange = color(255, 100, 0);
    darkOrange = color(180, 80, 0);
    black = color(0, 0, 0);
    white = color(255, 255, 255);
    green = color(16, 220, 50);
    darkGreen = color(29, 154, 44);
    //red = 255;
    //green = 100;
    //blue = 0;
    visible = true;
  }
  
  public Button(String t, ActionListener action){
    this(t);
    this.action = action;
  }
  
  public void setBounds(int x, int y, int w, int h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public void draw(){
    //dunkel orange, wenn Maus im Buttonbereich und Maus gedrückt; ansonsten orange
    //weiss, wenn Maus im Buttonbereich; ansonsten schwarz
    /*
    orange = color(255, 100, 0);
    darkOrange = color(180, 80, 0);
    black = color(0, 0, 0);
    white = color(255, 255, 255);
    */
    if(visible){
      if(pressed && isInBounds()){
        fill(darkGreen);
      }else{
        fill(green);
      }
      strokeWeight(3);//Randstaerke
      stroke(black);
      rect(x, y, w, h);
      if(isInBounds()){
        fill(white);
      }else{
        fill(black);
      }
      textSize(20);
      textAlign(CENTER, CENTER);
      text(text, x + w/2, y + h/2);
    }
    
  }
  
  public void mousePressed(){
    if(isInBounds() && visible){
      pressed = true;
    }
  }
  public void mouseReleased(){
    if(isInBounds() && pressed && action != null){
      action.actionPerformed(this);
    }
    pressed = false;
  }
  private boolean isInBounds(){
    //linker Rand; rechter Rand; oberer Rand; unterer Rand
    return (x <= mouseX && x+w >= mouseX && y <= mouseY && y+h >= mouseY);
  }
  //Getter Methoden
  public String getText(){
    return text;
  }
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  public int getWidth(){
    return w; 
  }
  public int getHeight(){
    return h;
  }
  //Setter Methoden
  public void setText(String t){
    text = t;
  }
  public void setVisible(boolean value){
    visible = value;
  }
}