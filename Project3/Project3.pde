int high = 0;
int low = 0;
int currTemp = 0;
String city = "";
String region = "";
String weather = "";
String input = "";
String zip = "75234";
String date = "";
PImage bg;
PImage img;
int counter;
int timer;
int state = 0;

//rain
Rain r1;
int numDrops = 50;
Rain[] drops = new Rain[numDrops]; // Declare and create the array

//cloud
Cloud cloudA = new Cloud(300, 200, 80, -1);
Cloud cloudB = new Cloud(200,300,110, 1);
Cloud cloudC = new Cloud(400,400,110, 1);
Cloud cloudD = new Cloud(250,350,100, -1);

//snow
Snow s1;
int numSnow = 50;
Snow[] flakes = new Snow[numSnow]; // Declare and create the array

//thunder
Thunder t1;

void getInfo(){  
  // The URL for the XML document
  String url = "http://xml.weather.yahoo.com/forecastrss?p=" + zip;
  
  // Load the XML document
  XML xml = loadXML(url);

  // Grab the element we want
  XML forecast = xml.getChild("channel/item/yweather:forecast");
  XML currForecast = xml.getChild("channel/item/yweather:condition");
  XML fecha = xml.getChild("channel/item/yweather:forecast");
  XML location = xml.getChild("channel/yweather:location");
  
  // Get the attributes we want
  city = location.getString("city");
  region = location.getString("region");
  date = fecha.getString("date");
  high = forecast.getInt("high");
  low = forecast.getInt("low");  
  weather = forecast.getString("text");
  currTemp = currForecast.getInt("temp");
}

void setup() {
  size(500, 500); 
  smooth();
  frameRate(50);
  //sunny
  String h = "http:";
  img = loadImage( h + "//www.clker.com/cliparts/x/s/r/n/A/5/sun-yellow-md.png");
  imageMode(CENTER);
  
  //rain
  //Loop through array to create each object
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Rain(); // Create each object
    r1 = new Rain();
  }
  
  //snow
  //Loop through array to create each object
  for (int i = 0; i < flakes.length; i++) {
    flakes[i] = new Snow(); // Create each object
    s1 = new Snow();
  }
}

void draw() {
  background(255);
  fill(0);
  getInfo();
  
  if (state == 0) {
    
    drawWeatherAnalysis();
    
    //current temperature
    fill(200,150,200);
    line(40, 480-(currTemp*4), 500, 480-(currTemp*4));
    
    //low point
    fill(31,19,242);
    text(low + "°F", 80, 480-(low*4));
    ellipse(90, 480-(low*4), 10, 10);
  
    //high point
    fill(242,19,31);
    text(high + "°F", 440, 480-(high*4));
    ellipse(450, 480-(high*4), 10, 10);
  } 
  else 
  {
    //Display everything
    displayData();
  
    //sunny clear
    counter++;
    if ( (weather.contains("Sunny")) || (weather.contains("Fair")) || (weather.contains("Clear")) )
    {
      background(204, 230, 255);
      drawSun();
    }
  
    //clouds
    if ( (weather.contains("Cloudy")) || (weather.contains("Partly Cloudy")) )
    {
      background(230, 230, 255);
      drawClouds();
    }
  
    //rain
    if ( (weather.contains("Rain")) || (weather.contains("AM Showers")) || (weather.contains("PM Showers")) )
    {
      background(224, 224, 235);
      drawRain();
    }
  
    //snow
    if ( (weather.contains("Snow")) )
    {
      background(242, 242, 242);
      drawSnow();
    }
  
    //thunder storm
    if ( (weather.contains("Thunderstorms")) )
    {
      background(224, 224, 235);
      drawRain();
      drawClouds();
      drawThunder();
    }
  
    //Display everything
    displayData();
  
    }
} 

//toggle between graph and animations
void mousePressed() {
  state = (state + 1) % 2;
}

//read input
void keyPressed() {
  // If the return key is pressed, save the String and clear it
  if (key == '\n' ) {
    zip = input;
    // A String can be cleared by setting it equal to ""
    input = ""; 
  } else {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    input = input + key; 
  }
}

void displayData(){
  textAlign(LEFT);
  fill(0);
  text("Enter Zip Of Destination: " + input,10,10);
  text("City: " + city + ", " + region,10,30);
  text("Current Temperature: " + currTemp, 10, 50);
  text("Today’s high: " + high, 10, 70);
  text("Today’s low: " + low, 10, 90);
  text("Forecast: " + weather, 10, 110);
  text(date, 10, 130);
  
}

void drawSun(){
  pushMatrix();
  translate(width/2, height/2);
  rotate(counter*TWO_PI/360);
  image(img, 0, 0);
  popMatrix();
}

void drawRain(){  
  //Loop through array to use objects.
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
  }
  //Loop through array to use objects.
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
  }  
}

void drawClouds(){
  cloudA.update();
  cloudB.update();
  cloudC.update();
  cloudD.update();
}

void drawSnow(){
  //Loop through array to use objects.
  for (int i = 0; i < flakes.length; i++) {
    flakes[i].fall();
  }
  //Loop through array to use objects.
  for (int i = 0; i < flakes.length; i++) {
    flakes[i].fall();
  }
}

void drawThunder(){
  fill(0,25);
  rect(0,0,600,600); 
  t1 = new Thunder();
  //bolt every 2 seconds
  if (millis() - timer >= 2000) {
    timer = millis();
    t1.lightning();
    t1.lightning();
    t1.lightning();
    loop();
  }
}

void drawWeatherAnalysis(){
  stroke(205,201,201);
  strokeWeight(1);
  for(int y = 480; y > 0; y -= 20) { //draw line every 20 pixls;
    line(40,y,500,y);
  }
  stroke(139,137,137);
  strokeWeight(2);
  line(40,480,40,15);
  line(40,480,500,480);
   
  //draw y axis 
  fill(0);
  textAlign(RIGHT);
  int start = 0;
  for(int i = 0; i < 12; i++) {
    text(start + "°F", 33, 480 - i * 40);
    start = start + 10;
  }
}