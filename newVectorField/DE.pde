PVector function(PVector p){
  //if (p.x == 0 && p.y == 0){
  //  return function(new PVector(0.001,0,001));
  //}
  
  //3 attraction points
  //float dx = 0.005*(pow(p.x,4) - 4*pow(p.x,2)*pow(p.y,2) + pow(p.y,4));
  //float dy = 0.005*(4*pow(p.x,3)*p.y - 4*p.x*pow(p.y,3));
  
  // 'Magnetic' pole
  //float dx = p.x*p.x - p.y*p.y;
  //float dy = 2*p.x*p.y;
  
  // Swirly points along diagonal
  float dx = p.y - p.x;
  float dy = sin(p.x+p.y);
  
  // Lokta-Volterra
  //float dx = (2.0/3.0)*p.x - (4.0/3.0)*p.x*p.y;
  //float dy = p.x*p.y - p.y;
  
  // Van Der Pol
  //float mu = 1;
  //float dx = p.y;
  //float dy = mu*(1-pow(p.x,2))*p.y-p.x;
  //maxLen = 50.0;
  
  // Pendulum
  //float dx = 3*p.y;
  //float dy = -0.2*p.y - 5*sin(p.x);
  //maxLen = 13.0;
  
  // Assignment
  //float a = 1.0;
  //float b = 0.1;
  //float g = 0.1;
  //float e = 1.0;
  //float F = 0;
  
  //float dx = e*p.x - g*p.x*p.y;
  //float dy = b*p.x*p.y - a*p.y + F;
  
  //PVector temp = new PVector((e*a - g*F)/(b*e),e/g);
  //temp = screenPos(temp);
  //fill(50,255,255);
  //ellipse(temp.x,temp.y,5,5);
  
  return new PVector(dx,dy);
}

PVector screenPos(PVector p){
  float nX = (p.x - screenCentre.x)*gridScale;
  float nY = (p.y - screenCentre.y)*gridScale;
  return new PVector(nX,nY);
}