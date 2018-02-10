FlowField flow;
ArrayList<Particle> particles;

PVector target;
float target_radius = 50;

boolean debug_grid = false;
boolean debug_field = false;
boolean avoid_target = true;

PVector center = new PVector(width/2, height/2);

void setup() {
  size(1024, 768);
  frameRate(30);
  target = new PVector(width/2, height/2);

  particles = new ArrayList<Particle>();
  flow = new FlowFieldSineWave();
  //flow = new FlowFieldPerlinNoise();
  //flow = new FlowFieldCenter();
 // flow = new FlowFieldRandom();
  //flow = new FlowField();
  flow.generate();
  

  particles.add(new Particle(new PVector(width/2, height/2)));
}

void draw() { 
  background(0);
  if (debug_field) flow.display_field();
  if (debug_grid)  flow.display_grid();
  //flow.generate();

  for (Particle v : particles) {
    apply_behaviors(v);
  }
  show_target();
}

void apply_behaviors(Particle v) {
  if (avoid_target) {    
    PVector avoid_force = v.avoid(target, target_radius);
    v.apply_force(avoid_force);
  }
  PVector follow_force = v.follow(flow); 
  v.apply_force(follow_force);
  
  //PVector center = new PVector(width/2, height/2);
  //float d = PVector.dist(center,v.position);
  //if (d < 10) {
  //  if(random(1) < 0.5){
  //    int b = round(random(1));
  //    if (b > 0){
  //       v.position.x = 0;         
  //    } else {
  //      v.position.x = width;
  //    }
  //    v.position.y = random(0,height);
  //  } else{
  //    int b = round(random(1));
  //    if (b > 0){
  //       v.position.y = 0;         
  //    } else {
  //      v.position.y = width;
  //    }
  //    v.position.x = random(0,width);
  //  }   

  //}
  v.run();
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      flow.vel_noise += 0.01;
    } else if (keyCode == DOWN) {
      flow.vel_noise -=0.01;
    }
  } else if (key == 'G' || key == 'g') {
    debug_grid = !debug_grid;
  } else if (key == 'F' || key =='f') {
    debug_field = !debug_field;
  } else if (key == 'A' || key == 'a') {
    avoid_target = !avoid_target;
  }
}

void mouseClicked() {

  if (mouseButton == LEFT) {
    for (int i = 0; i < 500; i++) 
      particles.add(new Particle(new PVector(mouseX, mouseY)));
  } else if (mouseButton == RIGHT) {
    target.x = mouseX;
    target.y = mouseY;
  }
}

void show_target() {
  ellipseMode(RADIUS);
  noFill();
  stroke(255, 0, 255);
  ellipse(target.x, target.y, target_radius, target_radius);
}