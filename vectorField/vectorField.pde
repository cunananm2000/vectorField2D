PVector canvasCentre = new PVector(0,0);
int canvasScale = 20; //50px = 1 unit
float timeScale = 0.01;

int nRows; //number of rows
int nCols; //number of cols

boolean showPath = !true;

Dot[] dots;

Dot mainDot = new Dot(0,0,255);
Dot nextDot = new Dot(1,1,255);

int deadDots = 0;

void setup(){
  size(800,800);
  nRows = height/canvasScale;
  nCols = width/canvasScale;
  dots = new Dot[nRows*nCols];
  for (int i = 0; i < nRows; i++){
    for (int j = 0; j < nCols; j++){
      float x = map(j,0,nCols,-nCols,nCols); //depends on nCols
      float y = map(i,0,nCols,-nRows,nRows);
      float col = atan(y/(x+0.01));
      col = map(col,-PI/2,PI/2,0,255);
      dots[j+i*nCols] = new Dot(x,y,col);
    }
  }
}

void draw(){
  background(0);
  //rect(0,0,canvasScale,canvasScale);
  
  translate(width/2,height/2);
  scale(1,-1);
  
  //colorMode(RGB);
  //noStroke();
  //fill(255,255,255);
  //ellipse(0,0,1.414*canvasScale,1.414*canvasScale);
  
  backGraph(canvasScale,true);
  
  for (Dot d: dots){
    d.show(canvasCentre, canvasScale, 2, showPath);
    d.update(timeScale,showPath, canvasScale);
  }
  
  //mainDot.show(canvasCentre, canvasScale, 2, showPath);
  //nextDot.show(canvasCentre, canvasScale, 2, showPath);
}