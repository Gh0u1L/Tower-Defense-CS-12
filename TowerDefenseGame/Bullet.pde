//Some towers shoot bullets! If a mob is hit by a bullet,
//it does damage.

class Bullet {

  float x, y, vx, vy, d, r;
  int hp;
  //int type;
  //final int Gun = 2;
  //final int Sniper = 3;
  //final int AOE = 4;
  Bullet(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 15;
    hp = 1;
    //type = Gun;
  }
  

  void act() {
    //if (type == Gun) {
      x = x + vx;
      y = y + vy;

      if (x < 0 || x > 800 || y < 0 || y > 800) hp = 0;
    }
  //}
  void show() {
    //if (type == Gun) {
      stroke(black);
      strokeWeight(1);
      fill(black);
      circle(x, y, d);
    //}
  }
}
