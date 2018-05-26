
class Population {
  Dot[] dots;
  
  Population(int size) {
    dots = new Dot[size];
    int i;
    for (i=0; i<size; i++) {
      dots[i] = new Dot(500);
    }
  }
  
  void step() {
    for (int i=0; i<dots.length; i++)
    {
      dots[i].step();
    }
  }
  
  void draw() {
    for (int i=0; i<dots.length; i++)
    {
      dots[i].draw();
    }
  }
  
  boolean allDead() {
    int i;
    for (i=0; i<dots.length; i++)
    {
      if (!dots[i].dead)
        return false;
    }
    return true;
  }
  
  void calculateFitness() {
    for (int i=0; i<dots.length; i++)
    {
      dots[i].calculateFitness();
    }
  }
  
  float sumFitness() {
    int i;
    float sum = 0;
    for (i=0; i<dots.length; i++)
    {
      sum += dots[i].fitness;
    }
    return sum;
  }
  
  void mutate() {
    int i;
    
    for (i=0; i<dots.length; i++)
    {
      dots[i].mutate();
    }
  }
  
  Population clone() {
    Population p = new Population(dots.length);
    int i;
    for (i=0; i<dots.length; i++)
    {
      p.dots[i] = dots[i].clone();
    }
    return p;
  }
}
