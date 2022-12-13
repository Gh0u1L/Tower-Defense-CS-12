//This function draws the BUILD screen
int type;
final int Gun = 2;
final int Sniper = 3;
final int AOE = 4;

void build() {
  drawMap();
  animateThings();
  drawPlayInterface2();
  HBC2();
}


void drawPlayInterface2 () {

  fill(grey);
  stroke(grey);
  rect(850, 400, 300, 800);

  fill(red);
  text("BUILD MODE", 850, 100);

  fill(red);
  text("$5", 860, 350);
  text("$10", 860, 475);
  text("$8", 860, 600);

  fill(white);
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

  Play.show();
  BuyGun.show();
  BuySniper.show();
  BuyAOE.show();
}

void HBC2 () {
  if (Play.clicked) {
    mode = PLAY;
  }

  if (Money >= 5 && BuyGun.clicked && BG == false) {
    type = Gun;
    Towers.add(new Tower(0, 0, 0, 60));
    Money = Money - 5;
  }

  if (Money >= 10 && BuySniper.clicked && BG == false) {
    type = Sniper;
    Towers.add(new Tower(0, 0, 0, 120));
    Money = Money - 10;
  }
  if (Money >= 7 && BuyAOE.clicked && BG == false) {
    AOES.add(new AoE_Ring(0, 0, 0, 60));
    Money = Money - 7;
  }
  
    if (BuyGun.clicked || BuySniper.clicked || BuyAOE.clicked) {
    BG = true;
  }
}
