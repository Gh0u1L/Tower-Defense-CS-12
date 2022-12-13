int map;

void  MapSelect() {
  
  matrix.show();

  Map1.show();
  Map2.show();
  
  if (Map1.clicked) {
    map = 1;
    nodes = map1nodes;
    mode = PLAY;
  }
  if (Map2.clicked) {
    map = 2;
    nodes = map2nodes;
    mode = PLAY;
  }
}
