import java.util.Random;//Improtieren aus der Java eine Klasse
import java.awt.event.KeyEvent; //für KeyReleased

//Variablen
private int[] pointPlayers;//Punktestände der Spieler
private PictureField[][] fields;
private int players;
private int remainingPairs;// für GameOver wichtig;

private int currentPlayer, gameState;
private PictureField cardOne, cardTwo;
private int startX = 50;
private int startY = 50;
private int length = 100;
private Scoreboard board;
private Button btnReset;
private int newGamePlayers;//zwischen 2 und 6




void setup(){
  size(800, 500);
  newGamePlayers = 2;
  btnReset = new Button("Start New Game", new ResetActionListener(this));
  btnReset.setVisible(true);
  btnReset.setBounds(0,0,250,250);
  
  initGame(4);
  board = new Scoreboard(700,200,100,500);
}
public void initGame(int players){
  btnReset.setVisible(false);
  this.players = players;
  pointPlayers = new int [players];
  currentPlayer = 0;
  gameState = 0;
  fields = new PictureField[6][4];//6 * 4 = 24
  remainingPairs = 12;
  ArrayList<PImage> listImages= new ArrayList<PImage>();
  ArrayList<Integer> listID = new ArrayList<Integer>();
  for(int i = 0; i < remainingPairs; i++){
    listImages.add(loadImage("img/" + i + ".png"));
    listImages.add(loadImage("img/" + i + ".png"));
    listID.add(i);
    listID.add(i);
  }
  Random r = new Random();//Nützlich für die Erufallszahlen
  //r.setSeed(1);//entfernen, wenn Spiel fertig
  int zeilen = fields[0].length;
  int spalten = fields.length;
  
  for (int i = 0; i < fields.length; i++){
   for (int l = 0; l < fields[i].length; l++){
     int index = r.nextInt(listImages.size());
     int id = listID.remove(index);
     PImage image = listImages.remove(index);
     fields[i][l] = new PictureField(startX + i * length , startY + l * length,length,length, image , id ,i + fields.length*l);//x+ Zeilenlänge/Anzahl Spalten + y
   }
  }

}


void draw(){
    background(50, 50, 150);
    btnReset.setText("Start " + newGamePlayers +" Player Game");
    btnReset.draw();
    board.draw(currentPlayer, pointPlayers);
     for (int i = 0; i < fields.length; i++){
    for (int l = 0; l < fields[i].length; l++){
      fields[i][l].draw();
      }
    }
    
    
}

void mousePressed(){
  btnReset.mousePressed();
  if(fields != null){
    for (int i = 0; i < fields.length; i++){
    for (int l = 0; l < fields[i].length; l++){
      fields[i][l].mousePressed();
      }
    }
  }
}

void mouseReleased(){
  btnReset.mouseReleased();
    for (int i = 0; i < fields.length; i++){
    for (int l = 0; l < fields[i].length; l++){
      
      if (fields[i][l].mouseReleased()){
        if (gameState == 0){
          cardOne = fields[i][l];
          cardOne.setState(1);
          gameState = 1;
        }else if (gameState == 1 ){
        if(cardOne.fieldID != fields[i][l].fieldID){
         
          cardTwo = fields[i][l];
          cardTwo.setState(1);//zweite Karte aufdecken
          if (isPair()){
            pointPlayers[currentPlayer]++;
          }
          gameState = 2;
        }
        }else{
          if(isPair()){
            cardOne.setState(2);//Karte verschwunden, wird nicht gezeichnet
            cardTwo.setState(2);
            remainingPairs--;//remainingPairs = (remainingPairs - 1);
            if(remainingPairs == 0){
              //Spiel zu Ende
              System.out.println("Game over");
              btnReset.setVisible(true);
            }
          }else{
            cardOne.setState(0);//Karte verdeckt
            cardTwo.setState(0);
            currentPlayer = (currentPlayer+1)%players;
          }
          gameState = 0;
          //Karte zudecken, wenn State 1
          //Karte aud State 2 setzen, wenn es ein Paar ist, ansonsten auf 0
          
          //
        }
        
      }
    }
  }


}
void keyReleased(){
  switch (keyCode){
    case KeyEvent.VK_NUMPAD2:
    case KeyEvent.VK_2: newGamePlayers = 2; break;
    case KeyEvent.VK_NUMPAD3:
    case KeyEvent.VK_3: newGamePlayers = 3; break;
    case KeyEvent.VK_NUMPAD4:
    case KeyEvent.VK_4: newGamePlayers = 4; break;
    case KeyEvent.VK_NUMPAD5:
    case KeyEvent.VK_5: newGamePlayers = 5; break;
    case KeyEvent.VK_NUMPAD6:
    case KeyEvent.VK_6: newGamePlayers = 6; break;
    default://ale andersn Fälle
    
  }
}

public int getNewGamePlayers(){
  return newGamePlayers;
}

public boolean isPair(){
  if(cardOne.getID() == cardTwo.getID()){
    return true;
    
  }else{
  return false;
  }
  
}