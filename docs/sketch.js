let screenCentre;
let gridScale = 100;  //Every line is n px apart
let gridSpace = 1;  //Show every nth line

let dt = 0.01;
let maxLen = 50.0;

let topLeft;
let botRight;
let nRows = 20;
let nCols = 20;

let circCentre;
let radius = 7.0;
let nSlices = 20;
let nRings = 20;

let fallOff = 20;

// PFont latex;
let dots = [];
let t = 0;
let zero;

function setup(){
	screenCentre = createVector(0,0);
	topLeft = createVector(-5,-5);
	botRight = createVector(5,5);

	circCentre = createVector(0,0);
	zero = createVector(0,0);

	let tL = createVector(-6,-3)
	let bR = createVector(6,3)

	useRectRegion(tL,bR,20,20);

	dots.push(new Dot(1,1,30))

	createCanvas(windowWidth, windowHeight);

	setFrameRate(30);
	background(0,0,0);

	colorMode(HSB);
	//useCircRegion(circCentre, radius, nSlices, nRings);
}

function draw(){
	background(0,0,0);
	translate(width/2,height/2);
	scale(1,-1);
	drawGridLines();

	strokeWeight(1);
	dots.forEach(d => d.showPath());

	noStroke();
	dots.forEach(d => {
		d.show();
		d.update();
	})

	fill(255);
	scale(1,-1);
	text("t = "+nf(t,0,3),-width/2 + 10,height/2 - 10);

	t += dt;
}

function windowResized() {
	resizeCanvas(windowWidth, windowHeight);
}

function drawGridLines() {
	stroke(50);
	strokeWeight(2);

	
	let x = -screenCentre.x-gridSpace;
	while (x*gridScale >= -width/2){
	  line(x*gridScale,height/2,x*gridScale,-height/2);
	  x -= gridSpace;
	}
	x = -screenCentre.x+gridSpace;
	while (x*gridScale <= width/2){
	  line(x*gridScale,height/2,x*gridScale,-height/2);
	  x += gridSpace;
	}
	
	let y = -screenCentre.y-gridSpace;
	while (y*gridScale >= -height/2){
	  line(-width/2,y*gridScale,width/2,y*gridScale);
	  y -= gridSpace;
	}
	y = -screenCentre.y+gridSpace;
	while (y*gridScale <= height/2){
	  line(-width/2,y*gridScale,width/2,y*gridScale);
	  y += gridSpace;
	}
	
	stroke(100);
	strokeWeight(3);
	
	line(-screenCentre.x*gridScale,height/2,-screenCentre.x*gridScale,-height/2);
	line(-width/2,-screenCentre.y*gridScale,width/2,-screenCentre.y*gridScale);
}

function f(p){
	//if (p.x == 0 && p.y == 0){
	//  return function(new PVector(0.001,0,001));
	//}
	
	//3 attraction points
	// let dx = 0.005*(pow(p.x,4) - 4*pow(p.x,2)*pow(p.y,2) + pow(p.y,4));
	// let dy = 0.005*(4*pow(p.x,3)*p.y - 4*p.x*pow(p.y,3));
	
	// 'Magnetic' pole
	// let dx = p.x*p.x - p.y*p.y;
	// let dy = 2*p.x*p.y;
	
	// Swirly points along diagonal
	// let dx = p.y - p.x;
	// let dy = sin(p.x+p.y);
	
	// Lokta-Volterra
	// let dx = (2.0/3.0)*p.x - (4.0/3.0)*p.x*p.y;
	// let dy = p.x*p.y - p.y;
	
	// Van Der Pol
	let mu = 1;
	let dx = p.y;
	let dy = mu*(1-pow(p.x,2))*p.y-p.x;
	//maxLen = 50.0;
	
	// Pendulum
	//let dx = 3*p.y;
	//let dy = -0.2*p.y - 5*sin(p.x);
	//maxLen = 13.0;
	
	return createVector(dx,dy);
  }
  
function screenPos(p){
	let nX = (p.x - screenCentre.x)*gridScale;
	let nY = (p.y - screenCentre.y)*gridScale;
	return createVector(nX,nY);
}

function useRectRegion(tL, bR, rows, cols){
	let mX = (tL.x + bR.x)/2.0;
	let mY = (tL.y + bR.y)/2.0;
	for (let i = 0; i < rows; i++){
		let y = map(i,0,rows-1,tL.y,bR.y);
		for (let j = 0; j < cols; j++){
			let x = map(j,0,cols-1,tL.x,bR.x);
			let col = atan((y-mY)/(x-mX+0.01));
			col = map(col,-PI/2,PI/2,0,255);
			let temp = new Dot(x,y,col);
			dots.push(temp);
			//println(x,y);
		}
	}
}
  
function useCircRegion(cent, r, slices, rings){
	let dC = 2*PI/(1.0*slices);
	let dR = r/(1.0*rings);
	for (let c = 0; c < 2*PI; c += dC){
		for (let i = 0; i < rings; i++){
			let x = cent.x + (i*dR)*cos(c);
			let y = cent.y + (i*dR)*sin(c);
			let col = map(c,0,2*PI,0,255);
			let temp = new Dot(x,y,col);
			dots.add(temp);
		}
	}
}