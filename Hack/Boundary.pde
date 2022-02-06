class Boundary {

  // A boundary is a simple rectangle with x,y,width,and height
  float x;
  float y;
  float w;
  float h;
  String type;
  
  // But we also have to make a body for box2d to know about it
  Body b;

  Boundary(float x_,float y_, float w_, float h_, String bodyType, float rot) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    type = bodyType;

    // Define the polygon
    PolygonShape sd = new PolygonShape();
    // Figure out the box2d coordinates
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    // We're just a box
    sd.setAsBox(box2dW, box2dH);


    // Create the body
    BodyDef bd = new BodyDef();
    if (type == "STATIC") {
      bd.type = BodyType.STATIC;
    } 
    else if (type == "KINEMATIC") {
      bd.type = BodyType.STATIC;
    }
    else if (type == "DYNAMIC") {
      bd.type = BodyType.DYNAMIC;
    }
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    
    // Attached the shape to the body using a Fixture
    b.createFixture(sd,1);
    b.setTransform(new Vec2(b.getPosition().x, b.getPosition().y), rot);
  }

  // Draw the boundary, if it were at an angle we'd have to do something fancier
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(b);
    // Get its angle of rotation
    float a = b.getAngle();

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
