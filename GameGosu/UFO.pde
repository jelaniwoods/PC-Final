class UFO {
  int hp;
  int score;
  
  float radius;
  float halfH; // HALF height
  
  PVector pos = new PVector(0f, 0f, 0f);
  PVector coverage = new PVector(0f, 0f);
  
  PShape ufoShape, top, body, bottom;
  
  UFO(float _radius) {
    hp = 5;
    score = 0;
    radius = _radius;
    halfH = 0.2 * radius;
    
    createUFOShape(50, 1.1* radius, 0.9* radius);
  }
  void createUFOShape(int sides, float r1, float r2){
    fill((int)random(255));
    stroke(150);
    
    float angle = 360 / sides;

    
    // Kind of like an upsidown dark choco reeses
    ufoShape = createShape(GROUP);
    
    top = createShape();
    top.beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r1;
        float y = sin( radians( i * angle ) ) * r1;
        top.vertex( x, y, -.2 * radius);
    }
    top.endShape(CLOSE);
    top.setFill(color(0,  0, 0));
    
    bottom = createShape();
    bottom.beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r2;
        float y = sin( radians( i * angle ) ) * r2;
        bottom.vertex( x, y, .2 * radius);
    }
    bottom.endShape(CLOSE);
    bottom.setFill(color(0, 0,0));
   
    
    body = createShape();
    body.beginShape(QUAD_STRIP); //< ---
    for (int i = 0; i < sides + 1; i++) {
        float x1 = cos( radians( i * angle ) ) * r1;
        float y1 = sin( radians( i * angle ) ) * r1;
        float x2 = cos( radians( i * angle ) ) * r2;
        float y2 = sin( radians( i * angle ) ) * r2;
        body.vertex( x1, y1, -.2 * radius);
        body.vertex( x2, y2, .2 * radius);
    }
    body.endShape(CLOSE);
    body.setFill(color(255, 255, 0));
    
    ufoShape.addChild(top);
    ufoShape.addChild(bottom);
    ufoShape.addChild(body);
    noStroke();
  }
  void scoreUp(){
    score += 1;
  }
  void getHit(){
    hp -=1;
    //change color to reflect being hit?
    ufoShape.getChild(2).setFill(color(255, 0, 0));
  }
  void renewPos(float ax, float ay, float az){
    pos.set(ax, ay, az);
    coverage.set(pos.x, pos.y);
  }
  void paint(){
    pushMatrix();
      translate(pos.x, pos.y, pos.z);
      shape(ufoShape);
    popMatrix();
  }
  void update(PVector axyz){
    if (hp > 0)
      renewPos(axyz.x, axyz.y, axyz.z);
    else 
      renewPos(12*radius*sin(0.001*millis()), 12*radius*cos(0.001*millis()), 2*radius);
    
    paint();
  }
}