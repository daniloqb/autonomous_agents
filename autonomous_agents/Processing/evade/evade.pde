Particle p;
Particle v;

boolean debug = true;

void setup() {
  size(1204, 768);

  v = new Particle(new PVector(0, 30));
  p = new Particle(new PVector(width/2, height/2));

  p.col = color(255, 0, 0);
  v.col = color(255, 255, 255);
}

void draw() {
  background(0); 
  frameRate(30);

  apply_behaviors();
}


void apply_behaviors() {

  boolean use_scan = true;
  PVector force = p.evade(v, use_scan);
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