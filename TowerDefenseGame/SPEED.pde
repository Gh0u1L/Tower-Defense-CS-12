class Speed extends Mob {
  
  Speed(float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d = 30;
    maxhp = 5 + WaveNumber;
    hp = maxhp;
    value = 2;
    fillcolor = red;
    strokecolor = LPurple;
    speed = 1.5;
  }
}
