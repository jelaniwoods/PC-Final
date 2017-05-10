import processing.opengl.*;

player Player1;
cam Cam1;

ArrayList blocks;

int delay = 0;
boolean[] keysPressed=new boolean[34];
final int vk_right=0;
final int vk_left=1;
final int vk_up=2;
final int vk_down=3;
final int vk_enter=4;
final int vk_escape=5;
final int vk_space=6;
final int vk_a=7;
final int vk_b=8;
final int vk_c=9;
final int vk_d=10;
final int vk_e=11;
final int vk_f=12;
final int vk_g=13;
final int vk_h=14;
final int vk_i=15;
final int vk_j=16;
final int vk_k=17;
final int vk_l=18;
final int vk_m=19;
final int vk_n=20;
final int vk_o=21;
final int vk_p=22;
final int vk_q=23;
final int vk_r=24;
final int vk_s=25;
final int vk_t=26;
final int vk_u=27;
final int vk_v=28;
final int vk_w=29;
final int vk_x=30;
final int vk_y=31;
final int vk_z=32;
final int mouse_left=33;
final int mouse_right=34;

int col = 0;

float x = 0;
float y = 0;
float z = 0;
int l = 50;
int w = 50;
int h = 50;

void setup()
{
  size(853, 480, OPENGL);
  blocks=new ArrayList();
  start_game();
}

void start_game()
{
  Player1=new player(600, 450, 0, 0, 0, 0);
  Cam1=new cam();
  x = Player1.x;
  y = Player1.y;
  z = Player1.z;
  blocks.add(new block(400, 592, -600, 3200, 16, 1600, color(0, 215, 0)));
  col = (int)random(255);
  //blocks.add(new block(900, 544, 100, 100, 48, 200, color(222, 0, 155)));
  //blocks.add(new block(500, 400, 200, 100, 16, 100, color(0, 120, 120)));
  //blocks.add(new block(700, 448, 100, 100, 16, 100, color(123, 211, 95)));
  //blocks.add(new block(500, 400, 200, 100, 16, 100, color(10, 110, 55)));
  //blocks.add(new block(300, 378, 100, 100, 16, 100, color(0, 0, 225)));
  //blocks.add(new block(100, 448, 200, 100, 16, 100, color(111, 0, 255)));
  //blocks.add(new block(-100, 412, 100, 100, 16, 100, color(111, 211, 15)));
}
void end_game()
{
  for (int i1 = blocks.size()-1; i1 >= 0; i1--) 
  {
    block b = (block) blocks.get(i1);
    blocks.remove(b);
  }
  start_game();
}

void build() {
   //if ( keysPressed[vk_w]=true) {
   //     y-= 2; 
   //   }
   //   if ( keysPressed[vk_a]=true) {
   //     x-= 2; 
   //   }
   //    if ( keysPressed[vk_d]=true) {
   //     x+= 2; 
   //   }
   //   if ( keysPressed[vk_s]=true) {
   //     y+= 2; 
   //   }
   //   if ( keysPressed[vk_q]=true) {
   //     z-= 2; 
   //   }
   //    if ( keysPressed[vk_e]=true) {
   //     z+= 2; 
   //   }
      
   if (keysPressed[vk_enter]==true && delay >= 20) {
     //x+4, y-8, z-2
     
      blocks.add(new block(Player1.x+4, Player1.y-18, Player1.z -2, Player1.l, Player1.w, Player1.h, color((int)random(255), (int)random(255), (int)random(255))));   
       delay = 0;
     
   }
textMode(SCREEN); textSize(20); textAlign(CENTER, TOP);
   text("X: " + x, width/2, height/2 - 40, width/2);
   text("Y: " + y, width/2, height/2 - 35, width/2);
   text("Z: " + z, width/2, height/2 - 30, width/2);
   
}

void draw()
{
  background(255,col, 255);
  delay++;
  //if (keysPressed[vk_space]==true && delay >= 25 ) {
  //  blocks.add(new block(Player1.x, Player1.y, Player1.z, 200, 16, 200, color((int)random(255), (int)random(255), (int)random(255))));   
  //  //delay = 0;
  //}
  
  build();
  Player1.update();
  Cam1.update();
  updateObjects();
}

void updateObjects()
{
  for (int i1 = blocks.size()-1; i1 >= 0; i1--) 
  {
    block b = (block) blocks.get(i1);
    b.update();
    if (box_collision_3d(Player1.x-8, Player1.y, Player1.z-8, Player1.x+8, Player1.y+16+Player1.vspeed, Player1.z+8, b.x, b.y, b.z, b.x+b.size_x, b.y-(b.size_y/4), b.z+b.size_z)==true)
    {
      Player1.block_collide_top=true;
    }
    if (box_collision_3d(Player1.x-8, Player1.y-(24-Player1.vspeed), Player1.z-8, Player1.x+8, Player1.y, Player1.z+8, b.x, b.y+(b.size_y/4), b.z, b.x+b.size_x, b.y+b.size_y, b.z+b.size_z)==true)
    {
      Player1.block_collide_bottom=true;
    }
    if (box_collision_3d(Player1.x-8, Player1.y-16, Player1.z-8, Player1.x+8, Player1.y+8, Player1.z+8, b.x+(b.size_x-8), b.y+4, b.z, b.x+b.size_x+8, (b.y+b.size_y)-4, b.z+b.size_z)==true)
    {
      Player1.block_collide_front=true;
    }
    if (box_collision_3d(Player1.x-8, Player1.y-16, Player1.z-8, Player1.x+8, Player1.y+8, Player1.z+8, b.x+8, b.y+4, b.z, b.x-8, (b.y+b.size_y)-4, b.z+b.size_z)==true)
    {
      Player1.block_collide_back=true;
    }
    if (box_collision_3d(Player1.x-8, Player1.y-16, Player1.z-8, Player1.x+8, Player1.y+8, Player1.z+8, b.x, b.y+4, b.z-2.5, b.x+b.size_x, (b.y+b.size_y)-4, b.z+2.5)==true)
    {
      Player1.block_collide_right=true;
    }
    if (box_collision_3d(Player1.x-8, Player1.y-16, Player1.z-8, Player1.x+8, Player1.y+8, Player1.z+8, b.x, b.y+4, b.z+(b.size_z-2.5), b.x+b.size_x, (b.y+b.size_y)-4, b.z+b.size_z+2.5)==true)
    {
      Player1.block_collide_left=true;
    }
  }
}