import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
Player player;
int screen = 1;
String[] fontList = PFont.list();
PFont font;
Box p;
ArrayList<Boundary> boundaries;

void keyPressed() {
  if (key == 'p') {
    screen = -screen;
  }
  if (key == ' ') {
    player.body.setLinearVelocity(new Vec2(0, 10));
  }
}

void setup() {
  size(500, 500);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);
  font = createFont(fontList[59], 20);
  textFont(font);
  fill(#000000);
  p = new Box(width/2,30, 10, 10);
  boundaries = new ArrayList<Boundary>();
  boundaries.add(new Boundary(250, 500, 500, 10));
  boundaries.add(new Boundary(0, 250, 10, 500));
  boundaries.add(new Boundary(500, 250, 10, 500));
  player = new Player(300, 200);
}

void draw() {
  
  box2d.step();
  background(#FFFFFF);
  if (screen == 1) {
    player.display();
    for (Boundary wall: boundaries) {
      wall.display();
    }
    p.display();
  }
  else if (screen == -1) {
    textAlign(CENTER);
    text("Test", width/2, 100);
  }
}
