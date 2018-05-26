
class Dot {
  PVector[] brain;
  int len;
  PVector pos;
  PVector vel;
  PVector acc;  //May not need - brain kinda covers this
  int clock;
  boolean dead;
  float fitness;
  float mutRate;
  int mode;
  
  Dot(int l) {
    len = l;
    brain = new PVector[len];
    for (int i=0; i<len; i++)
    {
      float x = random(-1,1);
      float y = random(-1,1);
      brain[i] = new PVector(x,y);
    }
    pos = new PVector(50,50);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    clock = 0;
    dead = false;
    fitness = 0;
    mutRate = 0.05;
    mode = 0;
  }
  
  private void move() {
    if (clock >= len)
    {
      dead = true;
      acc.set(0,0);
      vel.set(0,0);
    } else {
      acc = brain[clock];
      vel = vel.add(acc);
      pos = pos.add(vel);
    }
  }
  
  private void checkCollision() {
    if (pos.x > width*.99 || pos.y > height*.99 || pos.x < width*.01 || pos.y < height*.01)
    {
      dead = true;
    } else if (colliding(o)) {
      dead = true;
    }
  }
  
  void step() {
    if (!dead)
    {
      move();
      checkCollision();
      /*if (mode == 0) {
        fitness += pos.y;
      } else {
        fitness += 800 - pos.y;
      }*/
      clock += 1;
    } else {
      acc.set(0,0);
      vel.set(0,0);
      //fitness--;
      //fitness = max(0,fitness);
      //fitness = 0;
    }
  }
  
  void draw() {
    if (mode == 1) {
      fill(255,0,0);
      stroke(255,0,0);
    } else {
      fill(0);
      stroke(0);
    }
    ellipse(pos.x,pos.y,2,2);
  }
  
  void mutate() {
    int i;
    
    for (i=0; i<brain.length; i++)
    {
      float rand = random(0,1);
      if (rand < mutRate)
      {
        float mutx = random(-.1,.1);
        float muty = random(-.1,.1);
        PVector mut = new PVector(mutx, muty);
        brain[i] = brain[i].add(mut);
        //float x = random(-1,1);
        //float y = random(-1,1);
        //brain[i] = new PVector(x,y);
      }
    } //<>//
  }
  
  void calculateFitness() {
    fitness = 1/dist(pos.x, pos.y, width, height);
  }
  
  Dot clone() {
    Dot newDot = new Dot(brain.length);
    for (int i=0; i<brain.length; i++)
    {
      newDot.brain[i] = brain[i].copy();
    }
    return newDot;
  }
  
  boolean colliding(Obstacle[] o) {
    for (int i=0; i<o.length; i++)
    {
      if (o[i].inside(this))
        return true;
    }
    return false;
  }
}
