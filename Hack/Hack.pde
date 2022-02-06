import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
Player player;
String[] fontList = PFont.list();
PFont font;
Box p;
ArrayList<Boundary> boundaries;
PImage image;
float jump = 0;
boolean won = false;

void keyPressed() {
  if (key == ' ') {
    if (jump >= 200) {
      player.body.setLinearVelocity(new Vec2(player.body.getLinearVelocity().x, 7));
      jump = 0;
    }
  }
  if (key == 'a') {
    player.body.setLinearVelocity(new Vec2(-12, player.body.getLinearVelocity().y));
  }
  if (key == 'd') {
    player.body.setLinearVelocity(new Vec2(12, player.body.getLinearVelocity().y));
  }
  if (key == 's') {
    player.body.setLinearVelocity(new Vec2(0, player.body.getLinearVelocity().y));
  }
}

void setup() {
  size(1539, 703);
  frameRate(60);
  image = loadImage("foreground.png");
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);
  font = createFont(fontList[60], 20);
  textFont(font);
  fill(#000000);
  p = new Box(1400, 150, 10, 10);
  boundaries = new ArrayList<Boundary>();
  boundaries.add(new Boundary(0, 390, 2050, 10, "STATIC", 0));
  boundaries.add(new Boundary(1539, 390, 800, 10, "STATIC", 0));
  boundaries.add(new Boundary(939, 390, 270, 10, "STATIC", PI/4));
  boundaries.add(new Boundary(1159, 220, 130, 10, "STATIC", PI/4));
  boundaries.add(new Boundary(1400, 180, 400, 10, "STATIC", 0));
  boundaries.add(new Boundary(690, 20, 430, 10, "STATIC", PI/2));
  player = new Player(300, 300);
}

void draw() {
  background(#FFFFFF);
  if (won) {
    fill(0);
    text("You won", width/2, height/2);
  }
  else {
    box2d.step();
    if (jump < 200) {
      jump+=1.5;
    }
    player.display();
    /*
    for (Boundary wall: boundaries) {
      wall.display();
    }
    */
    p.body.setLinearVelocity(new Vec2(0, 0.5));
    p.display();
    image(image, 0, 0, 3077/2, 1407/2);
    fill(0);
    text("Jump: " + (int) jump/2 + "%", 10, 30);
    Vec2 pos = box2d.getBodyPixelCoord(player.body);
    if (pos.y > 700) {
      player = new Player(300, 300);
    }
    for (ContactEdge ce = player.body.getContactList(); ce != null; ce = ce.next)
    {
         if (ce.other == p.body && ce.contact.isTouching())
         {
             // Do what you want here
             won = true;
    
             break;
         }
    }
  }
}
