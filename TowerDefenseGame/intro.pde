//This function draws the INTRO screen.

void intro() {

  matrix.show();

  textSize(75);
  fill(LPurple);
  textFont(IT);
  text("TOWER DEFENSE", 500, 300);

  start.show();
  if (start.clicked) {
    mode = MAPSELECT;
  }
}
