float resolution = 100;
float scale = 25;
float pointSize = 10;
PVector rawPoints[] = {
  new PVector(2, 9),
  new PVector(1, 4),
  new PVector(9, 9.5),
  new PVector(19, 2),
};

String alhabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZÆØÅ";

void setup() {
  size(640, 640);
  noStroke();
}

int offset = 0;

void draw() { 
  background(0);
  
  for (int a = 0; a < resolution; a++) {
    ArrayList<PVector> l1Cursors = new ArrayList<PVector>();
    for (int b = 0; b < rawPoints.length - 1; b++) {
      l1Cursors.add(rawPoints[b].copy().lerp(rawPoints[b + 1], a*(1/resolution)));
    }
    
    ArrayList<PVector> l2Cursors = new ArrayList<PVector>();
    for (int b = 0; b < l1Cursors.size() - 1; b++) {
      l2Cursors.add(l1Cursors.get(b).copy().lerp(l1Cursors.get(b + 1), a*(1/resolution)));
    }
    
    ArrayList<PVector> l3Cursors = new ArrayList<PVector>();
    for (int b = 0; b < l2Cursors.size() - 1; b++) {
      l3Cursors.add(l2Cursors.get(b).copy().lerp(l2Cursors.get(b + 1), a*(1/resolution)));
    }
    
    fill(255, 0, 0);
    for (int b = 0; b < l3Cursors.size(); b++) {
      ellipse(l3Cursors.get(b).x * scale + offset, l3Cursors.get(b).y * scale + offset, pointSize, pointSize);
    }
    
    /*fill(0, 255, 0);
    for (int b = 0; b < l2Cursors.size(); b++) {
      ellipse(l2Cursors.get(b).x * scale, l2Cursors.get(b).y * scale + offset, pointSize, pointSize);
    }*/
    
    /*fill(0, 0, 255);
    for (int b = 0; b < l1Cursors.size(); b++) {
      ellipse(l1Cursors.get(b).x * scale + offset, l1Cursors.get(b).y * scale, pointSize, pointSize);
    }*/
    
    fill(255);
    for (int b = 0; b < rawPoints.length; b++) {
      ellipse(rawPoints[b].x * scale, rawPoints[b].y * scale, pointSize, pointSize);
      ellipse(rawPoints[b].x * scale + offset, rawPoints[b].y * scale, pointSize, pointSize);
      ellipse(rawPoints[b].x * scale + offset, rawPoints[b].y * scale + offset, pointSize, pointSize);
      ellipse(rawPoints[b].x * scale, rawPoints[b].y * scale + offset, pointSize, pointSize);
      
      textSize(48);
      text(alhabet.charAt(b), rawPoints[b].x * scale, rawPoints[b].y * scale);
      /*text(alhabet.charAt(b), rawPoints[b].x * scale + offset, rawPoints[b].y * scale);
      text(alhabet.charAt(b), rawPoints[b].x * scale, rawPoints[b].y * scale + offset);
      text(alhabet.charAt(b), rawPoints[b].x * scale + offset, rawPoints[b].y * scale + offset);*/
    }
  }
}
