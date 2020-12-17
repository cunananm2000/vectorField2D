void drawGridLines(){
  stroke(100);
  strokeWeight(2);
  
  float x = -screenCentre.x-gridSpace;
  while (x*gridScale >= -width/2){
    line(x*gridScale,height/2,x*gridScale,-height/2);
    x -= gridSpace;
  }
  x = -screenCentre.x+gridSpace;
  while (x*gridScale <= width/2){
    line(x*gridScale,height/2,x*gridScale,-height/2);
    x += gridSpace;
  }
  
  float y = -screenCentre.y-gridSpace;
  while (y*gridScale >= -height/2){
    line(-width/2,y*gridScale,width/2,y*gridScale);
    y -= gridSpace;
  }
  y = -screenCentre.y+gridSpace;
  while (y*gridScale <= height/2){
    line(-width/2,y*gridScale,width/2,y*gridScale);
    y += gridSpace;
  }
  
  stroke(255);
  strokeWeight(3);
  
  line(-screenCentre.x*gridScale,height/2,-screenCentre.x*gridScale,-height/2);
  line(-width/2,-screenCentre.y*gridScale,width/2,-screenCentre.y*gridScale);
}