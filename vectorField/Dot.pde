class Dot{
  PVector pos;
  float hue;
  ArrayList<PVector> vertices;
  boolean dead;
  
  Dot(float x, float y, float h){
    pos = new PVector(x,y);
    hue = h;
    vertices = new ArrayList<PVector>();
    vertices.add(new PVector(x,y));
  }
  
  void show(PVector centre, int scale, float r, boolean mode){
    colorMode(HSB);
    strokeWeight(r);
    stroke(hue,255,255);
    fill(hue,255,255);
    ellipse(scale*(centre.x + pos.x),scale*(centre.y + pos.y),2*r,2*r);
    
    if (mode){
      noFill();
      beginShape();
      for (PVector v: vertices){
        vertex(scale*(centre.x + v.x),scale*(centre.y + v.y));
      }
      endShape();
    }
  }
  
  void update(float dt, boolean savePath, int scale){
    if (!dead){
      PVector dDir = function(pos);
      dDir.mult(dt);
      
      if (savePath){
        vertices.add(new PVector(pos.x,pos.y));
      }
      
      pos.x += dDir.x;
      pos.y += dDir.y;
    } else {
      return;
    }
    
    if (pos.x > 1.0*width/scale || pos.x < -1.0*width/scale || pos.y > 1.0*height/scale || pos.y < -1.0*height/scale){
      dead = true;
      deadDots++;
      println(deadDots,"dead dots");
      if (deadDots == nRows*nCols-1){
        println("All dots dead");
        noLoop();
      }
    }
  }
}