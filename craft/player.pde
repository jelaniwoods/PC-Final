class player
{
  float x;
  float y;
  float z;
  int del = 0;
  int l = 64;
  int w = 64;
  int h =64;
  float hspeed;
  float vspeed;
  float zspeed;
  float rot_x;
  float rot_y;
  float rot_z;
  boolean parachute;
  boolean block_collide_top;
  boolean block_collide_bottom;
  boolean block_collide_front;
  boolean block_collide_back;
  boolean block_collide_right;
  boolean block_collide_left;
  player(float xpos, float ypos, float zpos, float hs, float vs, float zs)
  {
    x=xpos;
    y=ypos;
    z=zpos;
    hspeed=hs;
    vspeed=vs;
    zspeed=zs;
  }
  void update()
  {
    if (keysPressed[vk_right]==true)
    {
      if (zspeed>-5)
      {
        zspeed=zspeed-1;
      }
      if (zspeed<-5)
      {
        zspeed=zspeed+1;
      }
    }
    if (keysPressed[vk_left]==true)
    {
      if (zspeed>5)
      {
        zspeed-=1;
      }
      if (zspeed<5)
      {
        zspeed+=1;
      }
    }
    if (keysPressed[vk_up]==true)
    {
      if (hspeed>-5)
      {
        hspeed-= 1;
      }
      if (hspeed<-5)
      {
        hspeed=hspeed+1;
      }
    }
    if (keysPressed[vk_down]==true)
    {
      if (hspeed>5)
      {
        hspeed=hspeed-1;
      }
      if (hspeed<5)
      {
        hspeed=hspeed+1;
      }
    }
    if (keysPressed[vk_up]==false && keysPressed[vk_down]==false)
    {
      if (hspeed>0)
      {
        hspeed=hspeed-1;
      }
      if (hspeed<0)
      {
        hspeed=hspeed+1;
      }
    }
    if (keysPressed[vk_left]==false && keysPressed[vk_right]==false)
    {
      if (zspeed>0)
      {
        zspeed=zspeed-1;
      }
      if (zspeed<0)
      {
        zspeed=zspeed+1;
      }
    }
    if (block_collide_top==true)
    {
     vspeed=0; 
    }
    else if (vspeed<10)
    {
      if (keysPressed[vk_x]==true && vspeed>0)
      {
        parachute=true;
      }
      else
      {
        parachute=false;
      }
      if (parachute==true)
      {
      vspeed=vspeed+0.2;
      }
      if (parachute==false)
      {
      //vspeed=vspeed-0.7;
      }
      
      
     
    }
    if (keysPressed[vk_z]==true && keysPressed[vk_x]==false) {
      if (vspeed > 0 && vspeed < 10)
      {
        vspeed += .4;
      }
    }
    
    if (keysPressed[vk_x]==true && keysPressed[vk_z]==false) {
      if (vspeed > 0 && vspeed < 10)
      {
        vspeed -= .4;
      }
    }
    
    
     if (keysPressed[vk_w]==true && keysPressed[vk_s]==false) {
      if (l > 0 && l < 401)
      {
        l++;
      }
    }
    
     if (keysPressed[vk_s]==true && keysPressed[vk_w]==false)
    {
      if (l > 5 )
      {
        l-=1;
      }
    }
    
    
    
    if (keysPressed[vk_a]==true && keysPressed[vk_d]==false)
    {
      if (w > 0 && w < 401)
      {
        w++;
      }
    }
    
    if (keysPressed[vk_d]==true && keysPressed[vk_a]==false)
    {
      if (w > 5 && w < 401)
      {
        w--;
      }
    }
      
      if (keysPressed[vk_space]==true && keysPressed[vk_x]==false  ) {
       if (vspeed > 0)
      {
        vspeed=vspeed-5;
      }
      
    }
    
    if (keysPressed[vk_x]==true && keysPressed[vk_z]==false  ) {
       if (vspeed < 5)
      {
        vspeed=vspeed+1;
      }
    }
    println("L: " + l + " W: " + w + " H: "+ h );
    if ((keysPressed[vk_z]==true || keysPressed[vk_x]==true) && block_collide_top==true)
    {
     vspeed=-17; 
    }
    block_collide_top=false;
    if (block_collide_bottom==true)
    {
     vspeed=0;
     y=y+8;
    }
    block_collide_bottom=false;
    if (block_collide_front==true)
    {
     if (hspeed<0)
     {
       hspeed=0;
     }
    }
    block_collide_front=false;
    if (block_collide_back==true)
    {
     if (hspeed>0)
     {
       hspeed=0;
     }
    }
    block_collide_back=false;
    if (block_collide_right==true)
    {
     if (zspeed>0)
     {
       zspeed=0;
     }
    }
    block_collide_right=false;
    if (block_collide_left==true)
    {
     if (zspeed<0)
     {
       zspeed=0;
     }
    }
    block_collide_left=false;
    if (y>1500)
    {
     end_game();
    }
    x=x+hspeed;
    y=y+vspeed;
    z=z+zspeed;
    drawPlayer();
  }
  void drawPlayer()
  {
    pushMatrix();
    pointLight(255, 255, 255, x-64, 0, z-64);
    pointLight(255, 255, 255, x+64, 0, z-64);
    pointLight(255, 255, 255, x-64, 0, z+64);
    pointLight(255, 255, 255, x+64, 0, z+64);
    pointLight(255, 255, 255, x-64, y-64, z-64);
    pointLight(255, 255, 255, x+64, y-64, z-64);
    pointLight(255, 255, 255, x-64, y-64, z+64);
    pointLight(255, 255, 255, x+64, y-64, z+64);
    translate(x+4, y-8, z-2);
    rotateX(rot_x);
    rotateY(rot_y);
    rotateZ(rot_z);
    stroke(0, 0, 0);
    fill(255, 0, 0);
    box(l, w, h);
    popMatrix();
    if (parachute==true)
    {
      pushMatrix();
    translate(x-24, y-16, z-24);
    rotateX(rot_x);
    rotateY(rot_y);
    rotateZ(rot_z);
    stroke(0, 0, 0);
    fill(0, 255, 255);
    box(48, 8, 48);
    popMatrix();
    }
  }
}