public abstract class Field{
  protected int x, y, w, h;
  protected boolean pressed = false;
  
  //protected color colorBackground;
  protected boolean isMarked;
  
  public Field(int x, int y, int w, int h){
    this.x = x;//this.x ist von "private int x", x ist ein Uebergabeparameter
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  //abstrakte Methoden
  abstract void draw();
  abstract boolean mouseReleased();
  
 public void mousePressed(){
    if(isInBounds()){
      pressed = true;
    }
  }
  
  //@return ob Feld einen Klick registriert hat
  
  
  
  public void setMarked(){
    isMarked = true;
  }
  protected boolean isInBounds(){
    //linker Rand; rechter Rand; oberer Rand; unterer Rand
    return (x <= mouseX && x+w >= mouseX && y <= mouseY && y+h >= mouseY);
  }
}