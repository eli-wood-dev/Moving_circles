PVector circleSize;
PVector vel;

int numCircles = 5;

PVector [] circlePos = new PVector[numCircles];
PVector [] speed = new PVector[numCircles];
color [] colour = new color [] {
  color(255, 0, 0),
  color(0, 255, 0),
  color(0, 0, 255),
  color(255, 255, 0),
  color(255, 0, 255)
};

void setup() {
  fullScreen();
  circleSize = new PVector(50, 50);
  vel = new PVector(-0, 0);
  
  for (int i = 0; i < numCircles; i++) {
    circlePos[i] = new PVector((displayWidth - 100) + 50 * i, displayHeight - 100);
    speed[i] = new PVector((i + 1) * -2, 0);
  }
}

void draw() {
  //update
  for (int i = 0; i < numCircles; i++) {
    circlePos[i].add(speed[i]);
    circlePos[i].add(vel);
  }
  
  //check
  for (PVector p : circlePos) {
    if (p.x + (circleSize.x / 2) <= 0) {
      p.x = displayWidth + (circleSize.x / 2);
    }
  }
  
  //draw
  background(0);
  
  for (int i = 0; i < numCircles; i++) {
    fill(colour[i]);
    ellipse(circlePos[i].x, circlePos[i].y , circleSize.x, circleSize.y);
  }
}
