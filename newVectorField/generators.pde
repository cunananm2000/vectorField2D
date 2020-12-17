void useRectRegion(PVector tL, PVector bR, int rows, int cols){
  float mX = (tL.x + bR.x)/2.0;
  float mY = (tL.y + bR.y)/2.0;
  for (int i = 0; i < rows; i++){
    float y = map(i,0,rows-1,tL.y,bR.y);
    for (int j = 0; j < cols; j++){
      float x = map(j,0,cols-1,tL.x,bR.x);
      float col = atan((y-mY)/(x-mX+0.01));
      col = map(col,-PI/2,PI/2,0,255);
      Dot temp = new Dot(x,y,col);
      dots.add(temp);
      //println(x,y);
    }
  }
}

void useCircRegion(PVector cent, float r, int slices, int rings){
  float dC = 2*PI/(1.0*slices);
  float dR = r/(1.0*rings);
  for (float c = 0; c < 2*PI; c += dC){
    for (int i = 0; i < rings; i++){
      float x = cent.x + (i*dR)*cos(c);
      float y = cent.y + (i*dR)*sin(c);
      float col = map(c,0,2*PI,0,255);
      Dot temp = new Dot(x,y,col);
      dots.add(temp);
    }
  }
}