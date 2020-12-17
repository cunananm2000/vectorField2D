PVector screenCentre = new PVector(0,0);
float gridScale = 100;  //Every line is n px apart
float gridSpace = 0.5;  //Show every nth line

float dt = 0.01;
float maxLen = 50.0;

PVector topLeft = new PVector(-5,-5);
PVector botRight = new PVector(5,5);
int nRows = 20;
int nCols = 20;

PVector circCentre = new PVector(0,0);
float radius = 7.0;
int nSlices = 20;
int nRings = 20;

int fallOff = 10;

PFont latex;
ArrayList<Dot> dots = new ArrayList<Dot>();
float t = 0;

PVector zero = new PVector(0,0);