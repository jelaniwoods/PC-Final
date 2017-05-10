
class Creature { 
  Gaia gaia;
  float respawnH = 0f;
  float radius;
  
  PVector pos = new PVector(0, 0, 0);
  PVector projection = new PVector(0f, 0f);
  PVector speed = new PVector(0, 0, 0);
  
  boolean isAlive = false;
  int respawnTime = -1;

  Creature(Gaia _gaia){
    gaia = _gaia;
    radius = 0.01 * gaia.bound;
    respawn();
  }
  PVector generateSpeed(){
    return PVector.random2D();
  }
  boolean abductable(){
    return true;
  }
  void respawn(){
    respawnTime = -1;
    isAlive = true;
    
    pos.set(random(0f, gaia.bound), random(0f, gaia.bound), respawnH);
    speed = generateSpeed();
  }
  boolean checkOutOfBounds(){
    boolean returned = false;
    
    // check if creature moves out of bounds
    float[] posArray = new float[] {pos.x, pos.y, pos.z};
    for(int i=0; i<posArray.length; i++){
      if(posArray[i] > gaia.bound){
        posArray[i] -= gaia.bound;
        returned = true;
      }
      else if(posArray[i] < 0){
        posArray[i] += gaia.bound; 
        returned = true;
      }
    }
    pos.set(posArray[0], posArray[1], posArray[2]);
    return returned;
  }
  void move(){
    pos.add(speed);
    
    if (checkOutOfBounds() && !abductable()){
      respawn();
    }
    
    projection.set(pos.x, pos.y);
  }
  void paint(){
    sphere(radius);
  }
  
  void die(){
    gaia.ufo.scoreUp();
    isAlive = false;
    speed.set(0f, 0f, 10*radius);
  }
  void disappear(){
    respawnTime = int(random(75, 250));
  }
  void update(){
    // return color of ufo back to normal on next update
    // still might be too fast 
    gaia.ufo.ufoShape.getChild(2).setFill(color(255, 255, 0));
    if (isAlive){
      if (PVector.dist(projection, gaia.ufo.coverage) < gaia.ufo.radius )
        if ( abductable() && pos.z < gaia.ufo.pos.z - gaia.ufo.halfH ){
          // move into coverage of UFO, thus die 
          die();
        }
        // collision
        else if ( abs(pos.z - gaia.ufo.pos.z) < 2 * gaia.ufo.halfH ){
          gaia.ufo.getHit();
          disappear();
        }
      
    }
    else {
      if (respawnTime > 0){
        // alreadly dead and waiting to respawn
        respawnTime -= 1;
      }
      else if (respawnTime == 0){
        respawn();
      }
      else if (pos.z >= gaia.ufo.pos.z - 3*gaia.ufo.halfH){//dist(pos, gaia.ufo.pos) < gaia.ufo.radius
        // the moment being sucked into UFO
        disappear();
      }
    }
    
    move();
    if (respawnTime == -1){  
      pushMatrix();
      translate(pos.x, pos.y, pos.z);
      paint();
      popMatrix();
    }
    
  }
} 