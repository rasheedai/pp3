Mover mainmove;
Mover secondmove;
void setup() {
  size(640,360);
  mainmove = new Mover();
  secondmove = new Mover();
  mainmove.radius = 25;
  secondmove.radius = 50;
  mainmove.location.set(0+mainmove.radius,180);
  secondmove.location.set(640-secondmove.radius,180);
  mainmove.velocity.set(1,0);
  secondmove.velocity.set(-2,0);
}

class Mover{
  
  PVector location;
  PVector velocity;
  float radius;
  
  Mover(){
   location = new PVector(0,0); 
   velocity = new PVector(0,0);
  }
  void update(){
    location.add(velocity);
  }
  void display() {
    stroke(0);
    fill(175);
    circle(location.x, location.y,radius);
  }
  void checkEdges() {
    if (location.x > width) {
      velocity.x=velocity.x*-1;
    } else if (location.x < 0) {
      velocity.x=velocity.x*-1;
    }
    if (location.y > height) {
      velocity.y = velocity.y*-1;
    } else if (location.y < 0) {
      velocity.y = velocity.y*-1;
    }
  }
}
  PVector distance = new PVector(0,0);
void draw(){
  distance.set(abs(mainmove.location.x-secondmove.location.x),0);
  background(255);
  mainmove.update();
  secondmove.update();
  mainmove.checkEdges();
  secondmove.checkEdges();
  mainmove.display();
  secondmove.display();
  println(distance.mag());
  if(distance.mag()<= mainmove.radius){
    mainmove.velocity.set(-1,0);
    secondmove.velocity.set(1,0);
  }
}
