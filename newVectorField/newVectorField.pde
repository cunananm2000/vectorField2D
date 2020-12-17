void setup(){
  size(1400,800);
  background(0);
  latex = createFont("CMUSerif-Roman", 32);
  textFont(latex);
  //textAlign(CENTER, CENTER);
  colorMode(HSB);
  useRectRegion(topLeft,botRight,nRows,nCols);
  //useCircRegion(circCentre, radius, nSlices, nRings);
}

void draw(){
  background(0);
  translate(width/2,height/2);
  scale(1,-1);
  drawGridLines();
  //showVectorField();
  
  strokeWeight(1);
  for (Dot d: dots){
    d.showPath();
  }
  
  noStroke();
  for (Dot d: dots){
    d.show();
    d.update();
  }
  
  fill(255);
  scale(1,-1);
  text("t = "+nf(t,0,3),-width/2 + 10,height/2 - 10);
  
  t += dt;
}