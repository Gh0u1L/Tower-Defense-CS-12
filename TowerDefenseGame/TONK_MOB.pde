class TankMob extends Mob {

  TankMob(float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d = 80;
    maxhp = 25 + WaveNumber;
    hp = maxhp;
    value = 4;
    fillcolor = purple;
    strokecolor = pink;
    speed = 0.6;
  }
}
