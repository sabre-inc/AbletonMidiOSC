ArrayList <Line> line;

void setup () {
  
  size (800, 600, P3D);
  line = new ArrayList();
  for (int i=0; i < 30; i++) {
    line.add(new Line());
  }
}

void draw () {
   background(0);
  for (Line l1 : line) {
    l1.update();
  }
}

class Line {
  float x, y;
  float _x, _y;
  float z;
  float speed;
  float a;

// Line should be empty when it is recalled in line.add under void setup

  Line() {
    x = _x;
    y = _y;
    y = random (600);
    z = random(800);
    x = random(800);
    speed = 1;
    
    a = random(600);
  }

  void update () {
    barrier();
    draw();
    move();
    println(y);
  } 

void barrier () {
 if (z > 800) {
speed = -2;
 }
 if (z < 0) {
  speed = 2; 
 }
}
  void move () {
    z = z += speed;
  }

  void draw() {
    
    pushMatrix();
    stroke(255);
    line (x, z, y, a);
    popMatrix();
  }
}

