class Player extends Box {
  
  public Player(int x, int y) {
      super(x, y, 100, 200);
      body.setAngularVelocity(0);
      body.setLinearVelocity(new Vec2(0, 0));
  }
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    body.setAngularVelocity(0);
    float a = body.getAngle();

    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    rect(0, 0, w, h);
    popMatrix();
  }
}
