//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {

  float x, y, vx, vy, d;
  int value;
  float hp;
  float speed;
  float maxhp;
  color fillcolor, strokecolor;

  Mob (float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 50;
    value = 1;
    maxhp = 10 + WaveNumber;
    hp = maxhp;
    fillcolor = mobs;
    strokecolor = mobs;
    speed = 1;
  }

  void show() {
    fill(fillcolor);
    stroke(strokecolor);
    strokeWeight(3);
    circle(x, y, d);
  }

  void act() {
    x = x + vx*speed;
    y = y + vy*speed;

    if (y == 850) {
      Lives = Lives - 1;
      Mobs.remove(0);
    }

    int i = 0;
    while (i < nodes.length) {
      if (dist(nodes[i].x, nodes[i].y, x, y) < 1) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
      i++;
    }

    i = 0;
    while (i < Bullets.size()) {
      Bullet myBullet = Bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.d/2) {
        hp = hp - 2;
        myBullet.hp = myBullet.hp - 1;
      }
      i++;
    }
    i = 0;
    while (i < AOES.size()) {
      AoE_Ring myAOE = AOES.get(i);
      if (dist(myAOE.x, myAOE.y, x, y) < d/2 + myAOE.d/2 && myAOE.cooldown == myAOE.threshold) {
        hp = hp - 1;
      }
      i++;
    }
  }

  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-27, y-(d+10)-2, 54, 24);
    fill(purple);
    rect(x-25, y-(d+10), 50, 20);
    fill(pink);
    rect(x-25, y-(d+10), hp*50/maxhp, 20);
    rectMode(CENTER);
  }
}
