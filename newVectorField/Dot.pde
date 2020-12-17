class Dot{
  PVector pos;
  float hue;
  ArrayList<PVector> vertices;
  
  Dot(float x, float y, float h){
    pos = new PVector(x,y);
    hue = h;
    vertices = new ArrayList<PVector>();
    vertices.add(new PVector(x,y));
  }
  
  void show(){
    PVector p = screenPos(pos);
    fill(hue,255,255);
    ellipse(p.x,p.y,3,3);
  }
  
  void update(){
    PVector dDir = function(pos);
    dDir.mult(dt);
    
    vertices.add(new PVector(pos.x,pos.y));
    
    pos.x += dDir.x;
    pos.y += dDir.y;
    
    if (fallOff > 0 && vertices.size() > fallOff){
      vertices.remove(0);
    }
  }
  
  void showPath(){
    noFill();
    beginShape();
    
    for (PVector v: vertices){
      stroke(hue,255,150);
      vertex(gridScale*(v.x-screenCentre.x),gridScale*(v.y-screenCentre.y));
    }
    endShape();
  }
}