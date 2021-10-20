//An example of this movement would be throwing a rock directly in the air, which forms a parabola

Ship ship;
void setup(){
  size(640,360);
  ship = new Ship();
  ship.velocity.set(0,random(-1,-3));
}
class Ship{
  PVector toppoint;
  PVector velocity;
  PVector acceleration;
  
  Ship(){
   toppoint = new PVector(320,340);
   velocity = new PVector(0,0);
   acceleration = new PVector(0,-0.01);
  }
  void preupdate(){
    velocity.add(acceleration);
    toppoint.add(velocity);
  }
  void postupdate(){
    //acceleration.y+=-.05;
    velocity.sub(acceleration);
    toppoint.add(velocity);
  }
  void display(){
  stroke(0);
  fill(175);
  triangle(toppoint.x, toppoint.y, toppoint.x-10, toppoint.y+20, toppoint.x+10, toppoint.y+20);
  }
  
}


void draw(){
 background(255);
 boolean initialburn = true;
 if(ship.toppoint.y<240){
   initialburn = false;
   }
  if(initialburn){
    ship.preupdate();
  }
  else{
    ship.postupdate();
  }
  
 ship.display();
 println(ship.velocity);
 println(ship.acceleration);
}
