
var canvas = new fabric.Canvas('canvas');

function drawSquare() {
	var rect = new fabric.Rect({
	    left: 100,
	    top: 100,
	    fill: 'transparent',
	    width: 100,
	    height: 100,
	    stroke: 'black',
	    strokeWidth:10
	});

	canvas.add(rect);
	canvas.bringToFront(rect);
}

function drawCircle() {
	//var params = $.extend(defaultOptions, {radius: 10})
	var circle = new fabric.Circle({
	    radius: 50,
	    left: 100,
		top: 100,
		fill: 'transparent',
		stroke: 'black',
		strokeWidth:10
	});

	canvas.add(circle);
	canvas.bringToFront(circle);
}

function drawPin() {
	var pin = new fabric.Rect({
	    left: 100,
	    top: 100,
	    fill: 'black',
	    width: 10,
	    height: 150,
	});

	var circ1 = new fabric.Circle({
	    radius: 10,
	    left: 95,
		top: 95,
		fill: 'black'
	});

	var circ2 = new fabric.Circle({
	    radius: 10,
	    left: 95,
		top: 245,
		fill: 'black'
	});

	var group = new fabric.Group([ circ1, circ2, pin ], {
	    left: 150,
	    top: 100,
	    lockScalingX: true
	});

	group.setControlsVisibility({
         mt: true, 
         mb: true, 
         ml: false, 
         mr: false, 
         bl: false,
         br: false, 
         tl: false, 
         tr: false,
         mtr: true, 
    });

	canvas.add(group);
	canvas.sendToBack(group);
	canvas.bringForward(group);
}

function drawPlane() {
	var plane = new fabric.Rect({
	    left: 100,
	    top: 100,
	    fill: 'black',
	    width: 100,
	    height: 100
	});

	canvas.add(plane);
	canvas.sendToBack(plane);
}

function changeColor() {
	var color = this.id.toString();
	var object = canvas.getActiveObject();

	if (object.fill == "transparent")
		object.set('stroke', color);
	else
		object.set('fill', color);

	canvas.renderAll();
}

canvas.on('object:scaling', (e) => {
	var o = e.target;
	if (!o.strokeWidthUnscaled && o.strokeWidth) {
  	o.strokeWidthUnscaled = o.strokeWidth;
  }
	if (o.strokeWidthUnscaled) {
  	o.strokeWidth = o.strokeWidthUnscaled / o.scaleX;
  }
})

document.querySelectorAll("#elementButtons #squareElement").forEach(function(el) {
  el.onclick = drawSquare;
});

document.querySelectorAll("#elementButtons #circleElement").forEach(function(el) {
  el.onclick = drawCircle;
});

document.querySelectorAll("#elementButtons #pinElement").forEach(function(el) {
  el.onclick = drawPin;
});

document.querySelectorAll("#elementButtons #planeElement").forEach(function(el) {
  el.onclick = drawPlane;
});

document.querySelectorAll("#colorButtons button").forEach(function(el) {
  el.onclick = changeColor;
});