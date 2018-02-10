Particle vehicle;
Particle seek;

boolean debug = true;

void setup() {
  size(1204, 768);
  
  vehicle = new Particle();
  seek = new Particle();
  
  vehicle.debug = debug;
  seek.debug = debug;
  
  vehicle.col = color(255,255,255);
  
}

void draw() {
  background(0); 
  frameRate(30);
  
  apply_behaviors();
  
  seek.run();
  vehicle.run();
}


void apply_behaviors(){
  boolean use_scan = false;
  PVector wander_force = vehicle.wander();
  vehicle.apply_force(wander_force);
  
  PVector seek_force = seek.seek(vehicle,use_scan);
  seek.apply_force(seek_force);
  
  vehicle.debug = debug;
  seek.debug = debug;
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