//This function draws the PLAY screen

void play() {
  drawMap();
  animateThings();
  drawPlayInterface();
  HBC();
}
void drawMap() {
  if (map == 1) {
    background(green);

    //path
    stroke(path);
    strokeWeight(35);
    line(0, 400, 200, 400);
    line(200, 400, 200, 200);
    line(200, 200, 400, 200);
    line(400, 200, 400, 600);
    line(400, 600, 200, 600);
    line(200, 600, 200, 700);
    line(200, 700, 600, 700);
    line(600, 700, 600, 800);
    strokeWeight(1);

    int i = 0;
    while (i < 7) {
      nodes[i].show();
      i++;
    }
  } else if (map == 2) {

    Galaxy.show();

    //path
    stroke(path);
    strokeWeight(35);
    line(0, 400, 100, 400);
    line(100, 400, 100, 200);
    line(100, 200, 500, 200);
    line(500, 200, 500, 500);
    line(500, 500, 300, 500);
    line(300, 500, 300, 700);
    line(300, 700, 200, 700);
    line(200, 700, 200, 800);
    strokeWeight(1);

    int i = 0;
    while (i < 7) {
      nodes[i].show();
      i++;
    }
  }
}

void animateThings() {

  int i = 0;
  while (i < Mobs.size()) {
    Mob myMob = Mobs.get(i);
    myMob.act();
    myMob.show();
    myMob.healthbar();
    if (myMob.hp <= 0) {
      Money = Money + myMob.value;
      Mobs.remove(i);
    } else {
      i++;
    }
  }


  i = 0;
  while (i < Towers.size()) {
    Tower myTower = Towers.get(i);
    if (Mobs.size() > 0) myTower.act();
    myTower.show();
    i++;
  }

  i = 0;
  while (i < AOES.size()) {
    AoE_Ring myAOE = AOES.get(i);
    if (Mobs.size() > 0) myAOE.act();
    myAOE.show();
    i++;
  }

  i = 0;
  while (i < Bullets.size()) {
    Bullet myBullet = Bullets.get(i);
    myBullet.act();
    myBullet.show();
    if (myBullet.hp <= 0) {
      Bullets.remove(i);
    } else {
      i++;
    }
  }
}







void drawPlayInterface () {
  fill(grey);
  stroke(grey);
  rect(850, 400, 300, 800);

  battle.show();
  builds.show();
  if (builds.clicked && Mobs.size() <= 0) {
    mode = BUILD;
  }
  fill(white);
  text(""+WaveNumber+"", 920, 102);
  text("$MONEY$:", 800, 750);
  text(""+Money+"", 925, 750);
  if (Lives <= 3) {
    fill(red);
  } else if (Lives <= 6) {
    fill(yellow);
  } else {
    fill (green);
  }
  text("LIVES:", 800, 700);
  text(""+Lives+"", 925, 700);

  if (Lives <= 0) {
    mode = GAMEOVER;
  }
}


void HBC() {
  if (battle.clicked && Mobs.size() == 0) {
    WaveNumber++;
    addwave();
  }
}
void addwave() {
  int i = 0;
  int x = 0;
  while (i < WaveNumber) {
    Mobs.add(new Mob(x, 400, 1, 0));
    x = x - 60;
    i++;
  }
  if (WaveNumber % 3 == 0) {
    i = 0;
    x = 0;
    while (i < WaveNumber/3) {
      Mobs.add(new TankMob(x, 400, 1, 0));
      x = x - 120;
      i++;
    }
  }
  if (WaveNumber % 2 == 0) {
    i = 0;
    x = 0;
    while (i < WaveNumber/2) {
      Mobs.add(new Speed(x, 400, 1, 0));
      x = x - 40;
      i++;
    }
  }
}
