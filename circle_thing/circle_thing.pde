PVector circleSize;
PVector vel;

int numCircles = 6;

PVector [] speed = new PVector[numCircles];
ArrayList<PVector> speedList = new ArrayList<PVector>();
ArrayList<PVector> pList = new ArrayList<PVector>();
color [] colour = new color [] {
  color(255, 0, 0),
  color(0, 255, 0),
  color(0, 0, 255),
  color(255, 255, 0),
  color(255, 0, 255),
  color(0, 255, 255)
};

void setup() {
  fullScreen();
  circleSize = new PVector(50, 50);
  vel = new PVector(-0, 0);
  
  for (int i = 0; i < numCircles; i++) {
    speedList.add(new PVector((i + 1) * -2, 0));
    pList.add(new PVector((displayWidth - 100) + 50 * i, displayHeight - 100));
  }
}

void draw() {
  //update
  for (int i = 0; i < numCircles; i++) {
    pList.get(i).add(speedList.get(i));
    pList.get(i).add(vel);
  }
  
  //check
  for (PVector p : pList) {
    if (p.x + (circleSize.x / 2) <= 0) {
      p.x = displayWidth + (circleSize.x / 2);
    }
  }
  
  //draw
  background(0);
  
  for (int i = 0; i < numCircles; i++) {
    fill(colour[i]);
    ellipse(pList.get(i).x, pList.get(i).y , circleSize.x, circleSize.y);
  }
}
