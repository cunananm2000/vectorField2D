class Dot{
	constructor(x, y, h){
		this.pos = createVector(x,y);

		// console.log(this.pos)
		// console.log("oweihf")
		this.hue = h;
		this.vertices = [];
		this.vertices.push(createVector(x,y));
	}
	
	show(){
	  let p = screenPos(this.pos);
	  fill(this.hue,255,255);
	  ellipse(p.x,p.y,3,3);
	}
	
	update(){
	  let dDir = f(this.pos);
	  dDir.mult(dt);
	  
	  this.vertices.push(createVector(this.pos.x,this.pos.y));
	  
	  this.pos.x += dDir.x;
	  this.pos.y += dDir.y;
	  
	  if (fallOff > 0 && this.vertices.length > fallOff){
		this.vertices.splice(0,1);
	  }
	}
	
	showPath(){
		noFill();
		beginShape();
		stroke(this.hue,255,100);
		// this.vertices.forEach(v => {
		// 	vertex(gridScale*(v.x-screenCentre.x),gridScale*(v.y-screenCentre.y));
		// })

		// console.log(this.vertices)

		let i = 0;
		for (let v of this.vertices){
			stroke(this.hue,map(i,0,this.vertices.length,255,70),100)
			vertex(gridScale*(v.x-screenCentre.x),gridScale*(v.y-screenCentre.y));
			i++;
		}
		endShape();
	}
  }