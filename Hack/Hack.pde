
ArrayList<Interactable> ints = new ArrayList<Interactable>();
Player player = new Player(new PVector(300, 300));
int screen = 1;
String[] fontList = PFont.list();
PFont font;

void keyPressed() {
  if (key == ' ') {
    player.jump();
  }
  if (key == 'p') {
    screen = -screen;
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
  if (screen == 1) {
    player.drawPlayer();
    for (int i = 0; i < ints.size(); i++) {
      ints.get(i).doGravity();
    }
  }
  else if (screen == -1) {
    textAlign(CENTER);
    text("Test", width/2, 100);
  }
}
