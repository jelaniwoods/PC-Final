void keyPressed()
{
  if (keyCode==RIGHT)
  {
    keysPressed[vk_right]=true;
  }
  if (keyCode==LEFT)
  {
    keysPressed[vk_left]=true;
  }
  if (keyCode==UP)
  {
    keysPressed[vk_up]=true;
  }
  if (keyCode==DOWN)
  {
    keysPressed[vk_down]=true;
  }
  if (key==10)
  {
    keysPressed[vk_enter]=true;
  }
  if (key==27)
  {
    keysPressed[vk_escape]=true;
    key=0;
  }
  if (key==32)
  {
    keysPressed[vk_space]=true;
  }
  if (key=='a' || key=='A')
  {
    keysPressed[vk_a]=true;
  }
  if (key=='b' || key=='B')
  {
    keysPressed[vk_b]=true;
  }
  if (key=='c' || key=='C')
  {
    keysPressed[vk_c]=true;
  }
  if (key=='d' || key=='D')
  {
    keysPressed[vk_d]=true;
  }
  if (key=='e' || key=='E')
  {
    keysPressed[vk_e]=true;
  }
  if (key=='f' || key=='F')
  {
    keysPressed[vk_f]=true;
  }
  if (key=='g' || key=='G')
  {
    keysPressed[vk_g]=true;
  }
  if (key=='h' || key=='H')
  {
    keysPressed[vk_h]=true;
  }
  if (key=='i' || key=='I')
  {
    keysPressed[vk_i]=true;
  }
  if (key=='j' || key=='J')
  {
    keysPressed[vk_j]=true;
  }
  if (key=='k' || key=='K')
  {
    keysPressed[vk_k]=true;
  }
  if (key=='l' || key=='L')
  {
    keysPressed[vk_l]=true;
  }
  if (key=='m' || key=='M')
  {
    keysPressed[vk_m]=true;
  }
  if (key=='n' || key=='N')
  {
    keysPressed[vk_n]=true;
  }
  if (key=='o' || key=='O')
  {
    keysPressed[vk_o]=true;
  }
  if (key=='p' || key=='P')
  {
    keysPressed[vk_p]=true;
  }
  if (key=='q' || key=='Q')
  {
    keysPressed[vk_q]=true;
  }
  if (key=='r' || key=='R')
  {
    keysPressed[vk_r]=true;
  }
  if (key=='s' || key=='S')
  {
    keysPressed[vk_s]=true;
  }
  if (key=='t' || key=='T')
  {
    keysPressed[vk_t]=true;
  }
  if (key=='u' || key=='U')
  {
    keysPressed[vk_u]=true;
  }
  if (key=='v' || key=='V')
  {
    keysPressed[vk_v]=true;
  }
  if (key=='w' || key=='W')
  {
    keysPressed[vk_w]=true;
  }
  if (key=='x' || key=='X')
  {
    keysPressed[vk_x]=true;
  }
  if (key=='y' || key=='Y')
  {
    keysPressed[vk_y]=true;
  }
  if (key=='z' || key=='Z')
  {
    keysPressed[vk_z]=true;
  }
}

void keyReleased()
{
  if (keyCode==RIGHT)
  {
    keysPressed[vk_right]=false;
  }
  if (keyCode==LEFT)
  {
    keysPressed[vk_left]=false;
  }
  if (keyCode==UP)
  {
    keysPressed[vk_up]=false;
  }
  if (keyCode==DOWN)
  {
    keysPressed[vk_down]=false;
  }
  if (key==10)
  {
    keysPressed[vk_enter]=false;
  }
  if (key==27)
  {
    keysPressed[vk_escape]=false;
    key=0;
  }
  if (key==32)
  {
    keysPressed[vk_space]=false;
  }
  if (key=='a' || key=='A')
  {
    keysPressed[vk_a]=false;
  }
  if (key=='b' || key=='B')
  {
    keysPressed[vk_b]=false;
  }
  if (key=='c' || key=='C')
  {
    keysPressed[vk_c]=false;
  }
  if (key=='d' || key=='D')
  {
    keysPressed[vk_d]=false;
  }
  if (key=='e' || key=='E')
  {
    keysPressed[vk_e]=false;
  }
  if (key=='f' || key=='F')
  {
    keysPressed[vk_f]=false;
  }
  if (key=='g' || key=='G')
  {
    keysPressed[vk_g]=false;
  }
  if (key=='h' || key=='H')
  {
    keysPressed[vk_h]=false;
  }
  if (key=='i' || key=='I')
  {
    keysPressed[vk_i]=false;
  }
  if (key=='j' || key=='J')
  {
    keysPressed[vk_j]=false;
  }
  if (key=='k' || key=='K')
  {
    keysPressed[vk_k]=false;
  }
  if (key=='l' || key=='L')
  {
    keysPressed[vk_l]=false;
  }
  if (key=='m' || key=='M')
  {
    keysPressed[vk_m]=false;
  }
  if (key=='n' || key=='N')
  {
    keysPressed[vk_n]=false;
  }
  if (key=='o' || key=='O')
  {
    keysPressed[vk_o]=false;
  }
  if (key=='p' || key=='P')
  {
    keysPressed[vk_p]=false;
  }
  if (key=='q' || key=='Q')
  {
    keysPressed[vk_q]=false;
  }
  if (key=='r' || key=='R')
  {
    keysPressed[vk_r]=false;
  }
  if (key=='s' || key=='S')
  {
    keysPressed[vk_s]=false;
  }
  if (key=='t' || key=='T')
  {
    keysPressed[vk_t]=false;
  }
  if (key=='u' || key=='U')
  {
    keysPressed[vk_u]=false;
  }
  if (key=='v' || key=='V')
  {
    keysPressed[vk_v]=false;
  }
  if (key=='w' || key=='W')
  {
    keysPressed[vk_w]=false;
  }
  if (key=='x' || key=='X')
  {
    keysPressed[vk_x]=false;
  }
  if (key=='y' || key=='Y')
  {
    keysPressed[vk_y]=false;
  }
  if (key=='z' || key=='Z')
  {
    keysPressed[vk_z]=false;
  }
}
void mousePressed()
{
  if (mouseButton==LEFT)
  {
    keysPressed[mouse_left]=true;
  }
  /*if (mouseButton==RIGHT)
  {
    keysPressed[mouse_right]=true;
  }*/
}
void mouseReleased()
{
  if (mouseButton==LEFT)
  {
    keysPressed[mouse_left]=false;
  }
  /*if (mouseButton==RIGHT)
  {
    keysPressed[mouse_right]=false;
  }*/
}