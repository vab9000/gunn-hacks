class Player extends Interactable {
  public String imageFile;
  public PImage image;
  
  public Player(PVector p) {
      super();
      super.size[0] = 100;
      super.size[1] = 200;
      imageFile = "Character.png";
      super.pos = p.copy();
  }
  
  public void drawPlayer() {
      image(image, pos.x, pos.y, 100, 200);
  }
  
  public void jump() {
    pos.y -= 5;
  }
}
