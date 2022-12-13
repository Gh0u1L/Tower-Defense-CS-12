
//Blake Ne
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
final int MAPSELECT= 4;
int mode;
int WaveNumber;
int Money;
int Lives;
int count;

//Pallette
color grey   = #4D4A4D;
color LPurple= #FF40DC;
color mobs   = #1BF5E4;
color path   = #FFD940;
color red    = #FF0000;
color pink   = #ff595e;
color orange = #ffca3a;
color green  = #8ac926;
color blue   = #1982c4;
color purple = #6a4c93;
color yellow = #FCF224;
color white  = #ffffff;
color black  = #000000;

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;
boolean BG;

//Buttons
Button start;
Button battle;
Button builds;
Button Play;
Button BuyGun;
Button BuySniper;
Button BuyAOE;
Button Map1;
Button Map2;
Button Reset;

//Collections of objects
Node[] nodes;
Node[] map1nodes;
Node[] map2nodes;
ArrayList<Mob> Mobs;
ArrayList<Tower> Towers;
ArrayList<Bullet> Bullets;
ArrayList<AoE_Ring> AOES;

//Images and Gifs
Gif matrix;
Gif Galaxy;

//Fonts
PFont IT;

// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();
  WaveNumber = 0;
  Money = 10;
  Lives = 10;
  BG = false;
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  matrix = new Gif("frame_", "_delay-0.1s.gif", 19, 3, 500, 400, width, height);
  Galaxy = new Gif("frame_", "_delay-0.03s.gif", 19, 1, 500, 400, width, height);

  //Load Fonts
  IT = createFont("Mythias.otf", 90);

  //Create Collections of Objects
  Mobs = new ArrayList<Mob>();
  Towers = new ArrayList<Tower>();
  Bullets = new ArrayList<Bullet>();
  AOES = new ArrayList<AoE_Ring>();
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 3*height/4, 200, 100, white, black);
  Map1 = new Button("JUNGLE", 250, 400, 400, 300, white, black);
  Map2 = new Button("GALAXY", 750, 400, 400, 300, white, black);

  //PLAY - Next Wave, To Build Mode
  battle = new Button("Wave:", 850, 100, 200, 100, green, black);
  builds = new Button("Build", 850, 250, 200, 100, green, black);

  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
  Play = new Button ("Play", 850, 225, 200, 100, green, black);
  BuyGun = new Button ("GUN", 850, 350, 200, 100, blue, black);
  BuySniper = new Button ("SNIPER", 850, 475, 200, 100, red, black);
  BuyAOE = new Button ("AOE", 850, 600, 200, 100, orange, black);

  //GAMEOVER - Reset
  Reset = new Button ("Intro", 500, 600, 200, 200, red, black);
}

void makeNodes() {
  //Plot the nodes on the map
  map1nodes = new Node[7];

  map1nodes[0] = new Node(200, 400, 0, -1);
  map1nodes[1] = new Node(200, 200, 1, 0);
  map1nodes[2] = new Node(400, 200, 0, 1);
  map1nodes[3] = new Node(400, 600, -1, 0);
  map1nodes[4] = new Node(200, 600, 0, 1);
  map1nodes[5] = new Node(200, 700, 1, 0);
  map1nodes[6] = new Node(600, 700, 0, 1);

  map2nodes = new Node[7];

  map2nodes[0] = new Node(100, 400, 0, -1);
  map2nodes[1] = new Node(100, 200, 1, 0);
  map2nodes[2] = new Node(500, 200, 0, 1);
  map2nodes[3] = new Node(500, 500, -1, 0);
  map2nodes[4] = new Node(300, 500, 0, 1);
  map2nodes[5] = new Node(300, 700, -1, 0);
  map2nodes[6] = new Node(200, 700, 0, 1);
}


// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == MAPSELECT) {
    MapSelect();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
}
