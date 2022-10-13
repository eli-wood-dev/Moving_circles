PVector circleSize;
PVector circleHit;
PVector vel;
PVector mousePos;

int numCircles = 6;
int score = 0;
int crosshairSize = 50;

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
  noCursor();
  fullScreen();
  ellipseMode(CENTER);
  
  circleSize = new PVector(100, 100);
  circleHit = new PVector(circleSize.x*1.1, circleSize.y*1.1);
  
  vel = new PVector(-0, 0);
  
  mousePos = new PVector(0, 0);
  
  for (int i = 0; i < numCircles; i++) {
    speedList.add(new PVector((i + 1) * -2, 0));
    pList.add(new PVector((displayWidth - 100) + 50 * i, displayHeight - 200));
  }
}

void crosshair(PVector crosshairPos) {
  noFill();
  stroke(200, 0, 0);
  strokeWeight(5);
  ellipse(crosshairPos.x, crosshairPos.y, crosshairSize, crosshairSize);
  ellipse(crosshairPos.x, crosshairPos.y, crosshairSize/10, crosshairSize/10);
  strokeWeight(4);
  line(crosshairPos.x, crosshairPos.y - crosshairSize*0.8, crosshairPos.x, crosshairPos.y - crosshairSize*0.3);
  line(crosshairPos.x, crosshairPos.y + crosshairSize*0.8, crosshairPos.x, crosshairPos.y + crosshairSize*0.3);
  line(crosshairPos.x - crosshairSize*0.8, crosshairPos.y, crosshairPos.x - crosshairSize*0.3, crosshairPos.y);
  line(crosshairPos.x + crosshairSize*0.8, crosshairPos.y, crosshairPos.x + crosshairSize*0.3, crosshairPos.y);
  
  //line(crosshairPos.x - crosshairSize/2, crosshairPos.y, crosshairPos.x + crosshairSize/2, crosshairPos.y);
  //line(crosshairPos.x, crosshairPos.y - crosshairSize/2, crosshairPos.x, crosshairPos.y + crosshairSize/2);
}

void mouseClicked(){
  for (PVector p : pList) {
    if (dist(p.x, p.y, mousePos.x, mousePos.y) <= circleHit.x/2) {
      score += 1;
    }
  }
}

void draw() {
  //update
  circleSize.x = 100;
  circleSize.y = 100;
  
  for (int i = 0; i < numCircles; i++) {
    pList.get(i).add(speedList.get(i));
    pList.get(i).add(vel);
  }
  
  mousePos.x = mouseX;
  mousePos.y = mouseY;
  
  //check
  for (PVector p : pList) {
    if (p.x + (circleSize.x / 2) <= 0) {
      p.x = displayWidth + (circleSize.x / 2);
    }
  }
  
  //draw
  background(100);
  
  strokeWeight(0);
  for (int i = 0; i < numCircles; i++) {
    fill(colour[i]);
    ellipse(pList.get(i).x, pList.get(i).y , circleSize.x, circleSize.y);
  }
  
  crosshair(mousePos);
  
  fill(0);
  textSize(50);
  text(score, displayWidth - 100, 100);
}
