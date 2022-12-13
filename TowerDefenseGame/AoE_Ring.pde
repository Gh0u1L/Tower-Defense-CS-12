//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a
//short period of time.

class AoE_Ring {
  final int Placing = 0;
  final int Placed = 1;
  float x, y, d;
  int cooldown, threshold;
  int TowerMode;

  AoE_Ring(float _x, float _y, int c, int th) {
    x = _x;
    y = _y;
    d = 240;
    cooldown = c;
    threshold = th;
    TowerMode = Placing;
  }

  void show() {
    stroke(black);
    strokeWeight(4);
    fill(orange);
    if (TowerMode == Placed) {
      circle(x, y, 60);
    } else if (TowerMode == Placing) {
      circle(mouseX, mouseY, 60);
      if (mousePressed && mouseX < 675) {
        TowerMode = Placed;
        BG = false;
        x = mouseX;
        y = mouseY;
      }
    }
  }
  void act() {
    if (cooldown == threshold) {
      println("shot");
      cooldown = 0;
    } else {
      cooldown++;
    }
    if (cooldown >= 59) {
      fill(white);
      stroke(white);
      circle(x, y, d);
    }
  }
}
