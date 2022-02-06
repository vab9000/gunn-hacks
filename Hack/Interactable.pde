class Interactable {
  public PVector pos;
  public int[] size = new int[2];
  public Interactable() {}
  public void doGravity() {
    if (pos.y + size[1] < height) {
      pos.y += 1;
    }
  }
}
