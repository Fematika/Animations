let circle = x => {
    x = 2 * PI * x;
	return {
        x: Math.cos(x),
        y: Math.sin(-x)
    }; 
}
let horseshoe = x => {
    if (x <= 1 / 4) {
        x = 4 * x;
        x = -3 * Math.PI / 4 * x;
        return {
            x: Math.cos(x),
            y: Math.sin(x)
        };
    } else if (1 / 4 <= x && x <= 2 / 4) {
        x -= 1/4;
        x = 4 * x;
        x = Math.sqrt(2) / 2 * x - Math.sqrt(2) / 2;
        return {
            x : x,
            y: x
        }
    } else if (2 / 4 <= x && x <= 3/4) {
        x -= 2/4;
        x = 4 * x;
        x = -Math.sqrt(2) / 2 * x;
        return {
            x: x,
            y: -x
        }
    } else if (3 / 4 <= x && x <= 1) {
        x -= 3/ 4;
        x = 4 * x;
        x = -3 * Math.PI / 4 * x + 3 * Math.PI / 4;
        return {
            x: Math.cos(x),
            y: Math.sin(x)
        };
    }
};

function setup() {
	createCanvas(1280, 670);
}
let t = 0;
let x = 0;

function draw() {
	stroke(0);
	background(255);
	strokeWeight(4);
	translate(width / 2, height / 2);
	noFill();

	beginShape();

	for (let x = 0; x <= 1; x += 0.002) {
        vertex(80 * circle(x).x * (1 - t) + 80 * horseshoe(x).x * t, 80 * circle(x).y * (1 - t) + 80 * horseshoe(x).y * t);
        console.log(circle(x), horseshoe(x));
    }

    endShape();

	if (t <= 1) {
        t += 0.03;
	}
}
