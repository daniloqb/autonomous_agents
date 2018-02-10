Particle vehicle;
Particle flee;

boolean debug = true;

void setup() {
  size(1204, 768);
  
  vehicle = new Particle();
  flee = new Particle();
  
  vehicle.debug = debug;
  flee.debug = debug;
  
  vehicle.col = color(255,255,255);
  
}

void draw() {
  background(0); 
  frameRate(30);
  
  apply_behaviors();

}


void apply_behaviors(){
  boolean use_scan = true;
  PVector vehicle_force = vehicle.wander();
  vehicle.apply_force(vehicle_force);
  
  PVector wander_force = flee.flee(vehicle,use_scan);
  flee.apply_force(wander_force);
    
  flee.run();
  vehicle.run();
  
  vehicle.debug = debug;
  flee.debug = debug;
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