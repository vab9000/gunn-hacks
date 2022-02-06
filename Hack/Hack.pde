
ArrayList<Interactable> ints = new ArrayList<Interactable>();
Player player = new Player(new PVector(300, 300));
String screen = "main";
String[] fontList = PFont.list();
PFont font;

void keyPressed() {
  if (key == ' ') {
    player.jump();
  }
  if (key == 'p') {
    screen = "options";
  }
}


void setup() {
  size(500, 500);
  player.image = loadImage(player.imageFile);
  printArray(fontList);
  font = createFont(fontList[59], 20);
  textFont(font);
  fill(#000000);
  ints.add(player);
}

void draw() {
  background(#FFFFFF);
  if (screen == "main") {
    player.drawPlayer();
    for (int i = 0; i < ints.size(); i++) {
      ints.get(i).doGravity();
    }
  }
  else if (screen == "options") {
    textAlign(CENTER);
    text("Test", width/2, 100);
  }
}
