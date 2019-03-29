PVector function(PVector p){
  //float dx = pow(p.y,3) - 9*p.y;
  //float dy = pow(p.x,3) - 9*p.x;
  
  float dx = 0;
  float dy = p.y*sin(p.x);
  return new PVector(dx,dy);
}