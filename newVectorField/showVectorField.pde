void showVectorField(){
  // For every square on screen (or every lattice point?)
  fill(200,255,255);
  strokeWeight(2);
  float x = -screenCentre.x-gridSpace;
  while (x*gridScale >= -width/2){
    float y = -screenCentre.y;
    while (y*gridScale >= -height/2){
      drawArrow(x,y);
      y -= gridSpace;
    }
    y = -screenCentre.y+gridSpace;
    while (y*gridScale <= height/2){
      drawArrow(x,y);
      y += gridSpace;
    }
    x -= gridSpace;
  }
  x = -screenCentre.x;
  while (x*gridScale <= width/2){
    float y = -screenCentre.y;
    while (y*gridScale >= -height/2){
      drawArrow(x,y);
      y -= gridSpace;
    }
    y = -screenCentre.y+gridSpace;
    while (y*gridScale <= height/2){
      drawArrow(x,y);
      y += gridSpace;
    }
    x += gridSpace;
  }
}

void drawArrow(float x, float y){
  PVector pos,dir,out;
  pos = new PVector(x,y);
  dir = function(pos).sub(pos);
  float len = dist(dir.x,dir.y,0,0);
  println(len);
  dir = dir.div(2*len);
  out = dir.add(pos);
  
  float h = map(len,0,maxLen, 0, 255);
  stroke(h,255,100);
  line(pos.x*gridScale,pos.y*gridScale,out.x*gridScale,out.y*gridScale);
}