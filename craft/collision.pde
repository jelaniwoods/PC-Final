boolean box_collision_3d (float p1x1, float p1y1, float p1z1, float p1x2, float p1y2, float p1z2, float p2x1, float p2y1, float p2z1, float p2x2, float p2y2, float p2z2)
{
  if (p1x1<p2x1 && p1x1<p2x2 && p1x2<p2x1 && p1x2<p2x2)
  {
    return false;
  }
  else if (p1x1>p2x1 && p1x1>p2x2 && p1x2>p2x1 && p1x2>p2x2)
  {
    return false;
  }
  else if (p1y1<p2y1 && p1y1<p2y2 && p1y2<p2y1 && p1y2<p2y2)
  {
    return false;
  }
  else if (p1y1>p2y1 && p1y1>p2y2 && p1y2>p2y1 && p1y2>p2y2)
  {
    return false;
  }
  else if (p1z1<p2z1 && p1z1<p2z2 && p1z2<p2z1 && p1z2<p2z2)
  {
    return false;
  }
  else if (p1z1>p2z1 && p1z1>p2z2 && p1z2>p2z1 && p1z2>p2z2)
  {
    return false;
  }
  else
  {
    return true;
  }
}

boolean box_collision_2d (float p1x1, float p1y1, float p1x2, float p1y2, float p2x1, float p2y1, float p2x2, float p2y2)
{
  if (p1x1<p2x1 && p1x1<p2x2 && p1x2<p2x1 && p1x2<p2x2)
  {
    return false;
  }
  else if (p1x1>p2x1 && p1x1>p2x2 && p1x2>p2x1 && p1x2>p2x2)
  {
    return false;
  }
  else if (p1y1<p2y1 && p1y1<p2y2 && p1y2<p2y1 && p1y2<p2y2)
  {
    return false;
  }
  else if (p1y1>p2y1 && p1y1>p2y2 && p1y2>p2y1 && p1y2>p2y2)
  {
    return false;
  }
  else
  {
    return true;
  }
}