let quad = x => {
    x -= 0.5;
    x *= 2;
    return x * x;
}
let cubed = x => {
	x = 14 * x - 8;
	return -(x - 3) * (x + 8) * x; 
}
let horseshoe = x => {
	if (0 <= x && x <= 1 / 3) {
		x *= 3;
		x = -2.7 * x + 3;
		return {
			x: 20 * Math.cos(x) + 50 * Math.cos(Math.PI - 0.2) - 20 * Math.cos(0.2), 
			y: -20 * Math.sin(x) -50 * Math.sin(Math.PI - 0.2) + 20 * Math.sin(0.2)
		};
	} else if (1 / 3 <= x && x <= 2/3) {
		x -= 1 / 3;
		x *= 3;
		x = (Math.PI + 0.7) * x + Math.PI - 0.2;
		return {
			x: 50 * Math.cos(x), 
			y: -50 * Math.sin(x)
		};
	} else if (2 / 3 <= x && x <= 1) {
		x -= 2/3;
		x *= 3;
		x = 2.7 * x + 0.2;
		return {
			x: -20 * Math.cos(x) + 50 * Math.cos(2 * Math.PI + 0.2) + 15.6, 
			y: -20 * Math.sin(x) -50 * Math.sin(2 * Math.PI + 0.2) - 7
		};
	}
};

function setup() {
	createCanvas(1280, 670);
}
let t = 0;

function draw() {
	stroke(0);
	background(255);
	strokeWeight(4);
	translate(width / 2, height / 2);
	noFill();

	beginShape();

    if (t <= 1) {
        for (let x = 0; x <= 1; x += 0.01) {
            vertex(200 * x * (1 - t) + 400 * x * t, 150 * quad(x) * (1 - t) + cubed(x) * t);
        }
    } 
    else {
        let h = t - 1;
        for (let x = 0; x <= 1; x += 0.01) {
            vertex(400 * x * (1 - h) + 2.5 * horseshoe(x).x * h, cubed(x) * (1 - h) + 2.5 * horseshoe(x).y * h);
        }
    }

	endShape();

	if (t <= 2) {
		t += 0.01;
	}
}