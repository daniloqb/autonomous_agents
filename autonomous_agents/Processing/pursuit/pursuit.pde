Particle p;
Particle v;

boolean debug = true;

void setup() {
  size(1204, 768);

  v = new Particle(new PVector(0, 30));
  p = new Particle(new PVector(100, height - 100));

  v.velocity = new PVector(4, 1);
  p.velocity = new PVector(0, 0);

  p.col = color(255, 0, 0);
  v.col = color(255, 255, 255);
  p.maxspeed = 4;
}

void draw() {
  background(0); 
  frameRate(30);

  apply_behaviors();
}


void apply_behaviors() {

  boolean use_scan = false;

  PVector force = p.pursuit(v, use_scan);
  p.apply_force(force);
  
  p.run();
  v.run();
  
  p.debug = debug;
  v.debug = debug;
}

void mouseClicked() {

  v.position.x = mouseX;
  v.position.y = mouseY;
}

void keyPressed() {
  if (key == 'D' || key =='d') {
    debug = !debug;
  } else if (keyCode == UP) {
      p.maxspeed +=1;
    } else if (keyCode == DOWN) {
      p.maxspeed -=1;
      p.maxspeed = max(p.maxspeed,1);
    } 
}