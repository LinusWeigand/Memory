public class PictureField extends Field{
  private int state;//0: verdeckt
  //1: verdeckt markiert
  //2: aufgedeckt
  //3: aufgedeckt, aus dem Spiel genommen
  private PImage picture;
  private int id, fieldID;

  
  public PictureField(int x, int y, int w, int h, PImage pic, int id, int fieldID){
    super(x, y, w, h);
    //TODO
    picture = pic;
    this.id = id;
    this.fieldID = fieldID;

  }
  
  public void draw(){
   
    strokeWeight(2);
    stroke(0);
    noFill();
    int xr = x+10;
    int yr = y+10;
    int wr = w-20;
    int hr = h-20;
    
    
    switch(state){
    case 0:
    fill(25);//grau
    rect(xr,yr,wr,hr);
    break;
    case 1:
    image(picture,xr,yr,wr,hr);
    stroke(200,200,10);
    rect(xr,yr,hr,wr);
    break;
    case 3:
    break;
    default:
  }
  //<--  
  }
  
  public int getState(){
    return state;
  }
  public void setState(int s){
    state = s;
  }
  public int getID(){
    return id;//ID zum Bild
  }
  public int getFieldID(){
    return fieldID;
  }
  
  
  public boolean mouseReleased(){
    if(isInBounds() && pressed && state < 2){
      //System.out.println(text);
      pressed = false;
      return true;
    }else{
      pressed = false;
      return false;
    }
  }
  
  
}