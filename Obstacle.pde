
class Obstacle {
  float x1, y1, w, h;
  char type;
  
  Obstacle(float a, float b, float c, float d, char e) {
    x1 = a;
    y1 = b;
    w = c;
    h = d;
    type = e;
  }
  
  void draw() {
    fill(128);
    if (type == 'r')
      rect(x1, y1, w, h);
    if (type == 'c')
      ellipse(x1, y1, w, h);
    fill(0);
  }
  
  boolean inside(Dot d) {
    if (type == 'r') {
      if (d.pos.x > x1 && d.pos.x < (x1+w) && d.pos.y > y1 && d.pos.y < (y1+h))
        return true;
    } else if (type == 'c') {
      if (dist(d.pos.x, d.pos.y, x1, y1) < w/2)
        return true;
    }
    return false;
  }
  
  void set(float a, float b, float c, float d) {
    x1 = a;
    y1 = b;
    w = c;
    h = d;
  }
}
