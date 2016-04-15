// sample test
var r, g, b;

function setup() {
  createCanvas(window.innerWidth, window.innerHeight);
  // Pick colors randomly
  r = random(255);
  g = random(255);
  b = random(255);
}

function draw() {
  // Draw a circle
  fill(r, g, b, 127);
  ellipse(window.innerWidth/2, window.innerHeight/2, 200, 200);
}

// When the user clicks the mouse
function mousePressed() {
  // Check if mouse is inside the circle
  var d = dist(mouseX, mouseY, window.innerWidth/2, window.innerHeight/2);
  if (d < 100) {
    // Pick new random color values
    r = random(255);
    g = random(255);
    b = random(255);
  }
}

/*/GET OUR DATA//
var xmlhttp = new XMLHttpRequest();
//var url = "ufo.api";

xmlhttp.onreadystatechange = function() {
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        var myArr = JSON.parse(xmlhttp.responseText);
        myFunction(myArr);
    }
};
xmlhttp.open("GET", url, true);
xmlhttp.send();

function myFunction(arr) {
    var out = "";
    var i;
    for(i = 0; i < arr.length; i++) {
        out += '<a href="' + arr[i].url + '">' + 
        arr[i].display + '</a><br>';
    }
}*/