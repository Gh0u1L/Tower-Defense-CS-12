//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {

  final int Placing = 0;
  final int Placed = 1;
  final int Gun = 2;
  final int Sniper = 3;
  final int AOE = 4;
  int type;
  float x, y;
  float cooldown, threshold;
  int TowerMode;

  Tower(float _x, float _y, int c, int th) {
    x = _x;
    y = _y;
    cooldown = c;
    threshold = th;
    TowerMode = Placing;
    if (BuyGun.clicked) {
      type = Gun;
    }
    if (BuySniper.clicked) {
      type = Sniper;
    }
  }

  void show() {
    if (type == Gun) {
      stroke(black);
      strokeWeight(4);
      fill(blue);
      if (TowerMode == Placed) {
        square(x, y, 50);
      } else if (TowerMode == Placing) {
        square(mouseX, mouseY, 50);
        if (mousePressed && mouseX < 675) {
          TowerMode = Placed;
          BG = false;
          x = mouseX;
          y = mouseY;
        }
      }
    }
    if (type == Sniper) {
      stroke(black);
      strokeWeight(4);
      fill(red);
      if (TowerMode == Placed) {
        ellipse(x, y, 50, 50);
      } else if (TowerMode == Placing) {
        ellipse(mouseX, mouseY, 50, 50);
        if (mousePressed && mouseX < 675) {
          TowerMode = Placed;
          BG = false;
          x = mouseX;
          y = mouseY;
        }
      }
    }
  }
  void act() {
    if (type == Gun) {
      if (cooldown >= threshold) {
        println("shot");
        cooldown = 0;
        Bullets.add(new Bullet(x, y, 0, -10)); //Up
        Bullets.add(new Bullet(x, y, 0, 10));  //Down
        Bullets.add(new Bullet(x, y, -10, 0)); //Left
        Bullets.add(new Bullet(x, y, 10, 0)); //Right
        Bullets.add(new Bullet(x, y, -10, -10)); //UpLeft
        Bullets.add(new Bullet(x, y, 10, -10)); //UpRight
        Bullets.add(new Bullet(x, y, -10, 10)); //DownLeft
        Bullets.add(new Bullet(x, y, 10, 10)); //DownRight
      } else {
        cooldown++;
      }
    }
    if (type == Sniper) {
      cooldown++;
      stroke(red);
      if (cooldown >= 114) {
        strokeWeight(4);
      } else {
        strokeWeight(1);
      }
      line(x, y, Mobs.get(0).x, Mobs.get(0).y);
      if (cooldown == threshold) {
        cooldown = 0;
        Mobs.get(0).hp = Mobs.get(0).hp - 6;
      }
    }
  }
}
