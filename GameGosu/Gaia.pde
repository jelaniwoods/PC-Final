class Gaia {
  int stage;
  float bound;

  UFO ufo;

  Human[] humans = null;
  Airplane[] airplanes = null;

  PShape planeShape, body, rightwing, leftwing, tail;
  PShape humanShape, humanhead, humanbody;

  Gaia(UFO _ufo, float _bound) {
    stage = 0;
    bound = _bound;
    ufo = _ufo;
  }
  
  
  //basically from PS Shape tutorial
  void createHumanShape(){
    humanShape = createShape(GROUP);
    humanhead = createShape(SPHERE, 0.01 * bound);
    humanhead.setFill(color(101, 67, 33));// actual skin color
    humanhead.translate(0, 0, 0.060 * bound);
      
    humanbody = createShape(BOX, 0.015 * bound, 0.015 * bound, 0.040 * bound);
    humanbody.setFill(color(206, 161, 87));// skin color
    humanbody.translate(0, 0, 0.020 * bound);
      
    humanShape.addChild(humanhead);
    humanShape.addChild(humanbody);
  }
  void createplaneShape(){
    planeShape = createShape(GROUP);
    body = createShape(BOX, 0.150 * bound, 0.022 * bound, 0.022 * bound);
    body.setFill(color(155, 155, 155));// white
      
    rightwing = createShape(BOX, 0.015 * bound, 0.050 * bound, 0.015 * bound);
    rightwing.setFill(color(255, 110, 70)); 
    rightwing.rotateZ(120);
    rightwing.translate(0.025 * bound, 0.025 * bound, 0);
      
    leftwing = createShape(BOX, 0.015 * bound, 0.050 * bound, 0.015 * bound);
    leftwing.setFill(color(255, 110, 70)); 
    leftwing.rotateZ(-120);
    leftwing.translate(0.025 * bound, -0.025 * bound, 0);
      
    tail = createShape(BOX, 0.010 * bound, 0.060 * bound, 0.010 * bound);
    tail.setFill(color(255, 110, 70)); 
    tail.translate(-0.050 * bound, 0, 0);
    //tail.rotateX(90);  
    
    planeShape.addChild(body);
    planeShape.addChild(rightwing);
    planeShape.addChild(leftwing);
    planeShape.addChild(tail);
  }

  // a=make n # of ppl per level
  void createHumans(int n){
    createHumanShape();
    
    if (humans == null || humans.length != n){
      humans = new Human[n];
      for(int i = 0; i < humans.length; i++)
        humans[i] = new Human(this);	
    }
  }
  
  void createAirplanes(int n){
    createplaneShape();
    
    if (airplanes == null || airplanes.length != n){
      airplanes = new Airplane[n];
      for(int i = 0; i < airplanes.length; i++)
        airplanes[i] = new Airplane(this);	
    }
  }

 void updateBeings(Creature[] ppl){
    if (ppl != null)
      for(int i = 0; i < ppl.length; i++)
        if (ppl[i] != null)
	  ppl[i].update();
  }
  void newStage(){
    // display info
    fill(255, 210, 0); 
    textSize(bound/12);
    pushMatrix();
    translate(0, 1.4*bound, 0.8*bound);
    rotateY(radians(90));
    rotateZ(radians(-90));
    String info = " ABDUCT\nEVERYTHING\nScore: "  + str(ufo.score) + "\nStage: " + str(stage) +"\nHP    : "+ str(ufo.hp);
    if (ufo.hp > 0)
      text(info, -170, 0); 
    else
      text( "  ABDUCT\nEVERYTHING\nScore: "  + str(ufo.score) + "\nGame Over Man,\nGame OVER!", -170, 0);
      
    popMatrix();
    
    if (ufo.score >= 20*stage){
      stage += 1;
      createHumans( 100 * 1/stage );
      createAirplanes( stage / 2);
    }
    
  }
  void update() {
    newStage();
    
    updateBeings(humans);
    updateBeings(airplanes);

    pushMatrix();
    fill(10, 155, 160);//
    rect(0, 0, bound, bound);
      
    fill(102, 155, 255, 100);//
    rotateX(radians(90));
    rect(0, 0, bound, bound);
    rotateY(radians(90));
    rect(0, 0, bound, bound);
    rotateY(radians(-90));
    rotateX(radians(-90));
      
    translate(bound/2, bound/2, bound/2);
    stroke(0, 0, 255);
    noFill();
    box(bound);
    noStroke();
    popMatrix();
  
    
  }
}