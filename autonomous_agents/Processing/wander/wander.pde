Particle vehicle;
Particle wander;

boolean debug = true;

void setup() {
  size(1204, 768);
  
  vehicle = new Particle();
  wander = new Particle();
  
  vehicle.debug = debug;
  wander.debug = debug;
  
  vehicle.col = color(255,255,255);
  
}

void draw() {
  background(0); 
  frameRate(30);
  
  apply_behaviors();

}


void apply_behaviors(){
 
  PVector vehicle_force = vehicle.wander();
  vehicle.apply_force(vehicle_force);
  
  PVector wander_force = wander.wander();
  wander.apply_force(wander_force);
    
  wander.run();
  vehicle.run();
  vehicle.debug = debug;
  
  wander.debug = debug;
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