Particle vehicle;
PVector target;
float target_radius = 50;

boolean debug = true;

void setup() {
  size(1204, 768);
  
  vehicle = new Particle();
  target = new PVector(width/2, height/2);
  
  vehicle.debug = debug;
  
  vehicle.col = color(255,255,255);
  
}

void draw() {
  background(0); 
  frameRate(30);
  
  apply_behaviors();

}


void apply_behaviors(){

  PVector wander_force = vehicle.wander();
  PVector avoid_force = vehicle.avoid(target,target_radius);
  
  vehicle.apply_force(wander_force);
  vehicle.apply_force(avoid_force);
  
  vehicle.run();
  
  vehicle.debug = debug;
  
  show_target();
}

void mouseClicked(){

  vehicle.position.x = mouseX;
  vehicle.position.y = mouseY;

}

void keyPressed() {
    if (key == 'D' || key =='d') {
      debug = !debug;
} 

}

void show_target(){
 ellipseMode(RADIUS);
 noFill();
 stroke(255,0,255);
 ellipse(target.x, target.y,target_radius,target_radius);
}