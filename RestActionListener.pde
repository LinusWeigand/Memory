public class ResetActionListener implements ActionListener{
 private Memory game;
 public ResetActionListener(Memory game){this.game = game;
 this.game = game;
}

void actionPerformed(Button b){
  game.initGame(game.getNewGamePlayers());//Spielerzahl 4
  }
}