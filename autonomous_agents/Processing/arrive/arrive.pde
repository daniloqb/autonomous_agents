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

  boolean use_scan = false;
  
  PVector arrive_force = vehicle.arrive(target,use_scan);
  
  vehicle.apply_force(arrive_force);  
  vehicle.run();  
  vehicle.debug = debug;
  
  show_target();
}

void mouseClicked(){

  target.x = mouseX;
  target.y = mouseY;

}

void keyPressed() {
    if (key == 'D' || key =='d') {
      debug = !debug;
} else if (keyCode == UP) {
      vehicle.maxspeed += 1;
    } else if (keyCode == DOWN) {
      vehicle.maxspeed -=1;
      vehicle.maxspeed = max(vehicle.maxspeed,1);
    } 

}

void show_target(){
 target_radius = 0.5*((vehicle.maxspeed*vehicle.maxspeed)/vehicle.maxforce);
 ellipseMode(CENTER);
 noFill();
 stroke(255,0,255);
 ellipse(target.x, target.y,target_radius,target_radius);
}