final int SZ = 1000;
Population pop = new Population(SZ);
float t = 0;
float speed = 0;
Obstacle[] o = {new Obstacle(0,0,0,0, 'c'),
                new Obstacle(200,200,400,400, 'r')};
int gen = 0;

void setup() {
  size(800,800);
  stroke(0);
  fill(0);
}

void draw() {
  int parent, i;
  Dot parentDot;
  float sum;
  
  
  // Refresh the screen
  fill(255);
  rect(0,0,width,height);
  
  // Have them move
  pop.step();
  
  // Do a bunch of stuff at the end of the generation
  if (pop.allDead())
  {
    Population newPop = new Population(SZ);
    pop.calculateFitness();
    sum = pop.sumFitness();
    
    // Select parents and make baby clones
    for (i=0; i<SZ; i++)
    {
      parent = chooseParent(pop, sum);
      parentDot = pop.dots[parent];
      newPop.dots[i] = parentDot.clone();
      //newPop.dots[i].brain = parentDot.brain;
    }
    newPop.mutate(); 
    pop = newPop.clone();
    gen++;
    println(gen);
    t = 0;
    speed += 0.1;
  }
  
  // Update the obstacle
  t+=1;
  
  // Cars
  //o[0].set(200,-200+(10*t%1000),100,200);
  //o[1].set(500,800-(10*t%1000),100,200);
  
  // Doors
  //o[0].set(200,0,100,t);
  //o[1].set(500,800-t,100,t);
  
  // Corner grower
  o[0].set(800,800,t,t);
  
  // Draw the new positions
  fill(0,255,0);
  rect(750,750,50,50);
  fill(0);
  for (i=0; i<o.length; i++)
  {
    o[i].draw();
  }
  pop.draw();
}


int chooseParent(Population pop, float sum)
{
  int n = pop.dots.length; //<>//
  float f = random(sum);
  while (f > 0)
  {
    f -= pop.dots[n-1].fitness;
    n--;
  }
  //n++;
  return n;
}
