class block
{
  float x;
  float y;
  float z;
  int size_x;
  int size_y;
  int size_z;
  color fill_col;
  block(float xpos, float ypos, float zpos, int sx, int sy, int sz, color fc)
  {
    x=xpos;
    y=ypos;
    z=zpos;
    size_x=sx;
    size_y=sy;
    size_z=sz;
    fill_col=fc;
  }
  void update()
  {
    pushMatrix();
    translate(x+(size_x/2), y+(size_y/2), z+(size_z/2));
    //noStroke();
    stroke(0, 0, 0);
    fill(fill_col);
    box(size_x, size_y, size_z);
    //translate(-x, -y, -z);
    popMatrix();
  }
}