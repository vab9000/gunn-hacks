
ArrayList<Interactable> ints = new ArrayList<Interactable>();
Player player = new Player(new PVector(300, 300));

void keyPressed() {
  if (key == ' ') {
    player.jump();
  }
}


void setup() {
  size(500, 500);
  player.image = loadImage(player.imageFile);
  ints.add(player);
}

void draw() {
  background(#FFFFFF);
  player.drawPlayer();
  for (int i = 0; i < ints.size(); i++) {
    ints.get(i).doGravity();
  }
}
