class cam
{
  float cam_x;
  float cam_y;
  float cam_z;
  float point_x;
  float point_y;
  float point_z;
  cam()
  {
  }
  void update()
  {
    /*if (cam_x<Player1.x-300)
    {
     cam_x=cam_x+1; 
    }
    if (cam_x>Player1.x+300)
    {
     cam_x=cam_x-1; 
    }*/
    if (cam_y<Player1.y-160)
    {
     cam_y=cam_y+8; 
    }
    if (cam_y>Player1.y-160)
    {
     cam_y=cam_y-8; 
    }
    if (cam_z<Player1.z-25)
    {
     cam_z=cam_z+8; 
    }
    if (cam_z>Player1.z+25)
    {
     cam_z=cam_z-8; 
    }
    cam_x=Player1.x+300;
    //cam_y=Player1.y-250;
    //cam_z=Player1.z;
    point_x=Player1.x;
    point_y=Player1.y;
    point_z=Player1.z;
    camera(cam_x, cam_y, cam_z, point_x, point_y, point_z, 0, 1, 0);
  }
}