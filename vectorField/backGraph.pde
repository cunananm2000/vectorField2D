void backGraph(int scale, boolean showUnitLines){
  if (showUnitLines){
  
    stroke(100);
    strokeWeight(1);
    int nX = round(width/(2*scale)) + 1;
    for (int i = -1*nX; i < nX; i++){
      line(i*scale,-height/2,i*scale,height/2);
    }
    
    int nY = round(width/(2*scale)) + 1;
    for (int i = -1*nY; i < nY; i++){
      line(-width/2,i*scale,width/2,i*scale);
    }
  }
  
  stroke(255);
  strokeWeight(2);
  line(-width/2,0,width/2,0);
  line(0,-height/2,0,height/2);
}