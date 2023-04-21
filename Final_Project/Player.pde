
class Player {
  // physics
  PVector pos; float TopSpeed;
  PVector vel; PVector accel;
  
  // health
  float life;
  
  // invincibility
  String currentState;
  boolean invinAvailable;
  
  // timer and points
  float startTime; float endTime;
  float interval; 
  float points;
  
  Player () {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    accel = new PVector(.5, .5);
    interval = 24000;
    life = 10;
  }
  
  
  void update() {
    this.display();
    this.moving();
    if (life > 0) {
      points += 1;
    }
    println(points);
  }
  
  // visuals
  void display() {
    ellipse(pos.x, pos.y, 30, 30);
  }
  
  // all movement
  void moving(){
    vel.limit(7);
    
    if (keyPressed) {
      if (key == 'w'|| key == 'W'){
        vel.y = vel.y - accel.y;
        pos.y = pos.y + vel.y;
        vel.x = 0;
      } else if (key == 's' || key == 'S'){
        vel.y = vel.y + accel.y;
        pos.y = pos.y + vel.y;
        vel.x = 0;
      } else if (key == 'd' || key == 'D'){
        vel.x = vel.x + accel.x;
        pos.x = pos.x + vel.x;
        vel.y = 0;
      } else if (key == 'a' || key == 'A'){
        vel.x = vel.x - accel.x;
        pos.x = pos.x + vel.x;
        vel.y = 0;
      }
    } else {
      if (key == 'w'|| key == 'W' || key == 's' || key == 'S'){
        pos.y = pos.y + vel.y; 
        vel.y = vel.y * 0.99;
      } else if (key == 'd' || key == 'D' || key == 'a' || key == 'A'){
        pos.x = pos.x + vel.x;
        vel.x = vel.x * 0.99;
      }
    this.activateInvin();
    this.checkBounds();
    }
  }
  
  // keeping in bounds
  void checkBounds() {
    if (pos.y < 15) {
      pos.y = 15;
      vel.y = 0;
    } else if (pos.y > (height - 15)) {
      pos.y = height - 15;
      vel.y = 0;
    }
    if (pos.x < 15) {
      pos.x = 15;
      vel.x = 0;
    } else if (pos.x > (width - 15)){
      pos.x = width - 15;
      vel.x = 0;
    }
  }
  
  void activateInvin() {
    if (invinAvailable == true) {
      if (keyPressed && key == ' ') {
        currentState = "invin";
        startTime = points;
        endTime = startTime + interval;
        // code for invincinbility
        println(currentState);
        println(startTime);
      }
    }
  }
  
  void checkLife() {
    if (life <= 0) {
      print("Dead");
    }
  }
}
