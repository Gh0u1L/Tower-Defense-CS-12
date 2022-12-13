//This function draws the GAMEOVER screen.

void gameOver() {
  background(black);

  Reset.show();

  fill(white);
  textSize(100);
  text("GAMEOVER", 500, 200);
  text("WAVE LOST:", 350, 400);
  text(""+WaveNumber+"", 670, 400);

  if (mode == GAMEOVER) {
    Mobs = new ArrayList<Mob>();
    Towers = new ArrayList<Tower>();
    Bullets = new ArrayList<Bullet>();
    AOES = new ArrayList<AoE_Ring>();
  }
    if (Reset.clicked) {
      mode = INTRO;
      WaveNumber = 0;
      Money = 10;
      Lives = 10;
      //int i = 0;
      //while (i < Towers.size()) {
      //  Towers.remove(i);
      //  i++;
      //}
      //i = 0;
      //while (i < Mobs.size()) {
      //  Mobs.remove(i);
      //  i++;
      //}
      //i = 0;
      //while (i < AOES.size()) {
      //  AOES.remove(i);
      //  i++;
      //}
    }
  }
