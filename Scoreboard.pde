public class Scoreboard{
  private color textPlayer, textCurrentPlayer;
  private int x,y,w,h;
  public Scoreboard(int x,int y, int w, int h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.w = w;
    textPlayer = color(0);
    textCurrentPlayer = color(100,100,255);
  
}

public void draw(int currentPlayer, int[] points){
  textSize(18);
  textAlign(LEFT,BOTTOM);
  for(int i = 0; i < points.length; i++){
    if (currentPlayer == i){
      fill(textCurrentPlayer);
    }else{
      fill(textPlayer);
    }
    text("Player " + (i+1) + " : " + points[i], x,y + i * 30);
  }
}
}