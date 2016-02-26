int temperature = 0;
int low = 0;
int currTemp = 0;
String weather = "";
String input = "";
String zip = "75234";
PImage bg;
PImage img;
String searchTwitterForThis = "";
int counter;

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


void getInfo(){
  // The URL for the XML document
  String url = "http://xml.weather.yahoo.com/forecastrss?p=" + zip;
  
  // Load the XML document
  XML xml = loadXML(url);

  // Grab the element we want
  XML forecast = xml.getChild("channel/item/yweather:forecast");
  XML currForecast = xml.getChild("channel/item/yweather:condition");
  
  // Get the attributes we want
  temperature = forecast.getInt("high");
  low = forecast.getInt("low");  
  weather = forecast.getString("text");
  currTemp = currForecast.getInt("temp");
}
void setup() {
  size(500, 500); 
  
  //sunny
  String h = "http:";
  img = loadImage( h + "//www.clker.com/cliparts/x/s/r/n/A/5/sun-yellow-md.png");
  imageMode(CENTER);
  
  //cloud
  smooth();
  frameRate(40);
  
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
  int indent = 10;
  fill(0);
  getInfo();
  
  //sunny clear
  counter++;
  if ( (weather.contains("Sunny")) || (weather.contains("Clear")) )
  {
    background(204, 230, 255);
    translate(width/2, height/2);
    rotate(counter*TWO_PI/360);
    image(img, 0, 0);
  }
  
  //clouds
  if ( (weather.contains("Cloudy")) || (weather.contains("Partly Cloudy")) )
  {
    background(230, 230, 255);
    cloudA.update();
    cloudB.update();
    cloudC.update();
    cloudD.update();
  }
  
  //rain
  if ( (weather.contains("Rain")) || (weather.contains("AM Showers")) || (weather.contains("PM Showers")) )
  {
    background(224, 224, 235);    
    //Loop through array to use objects.
    for (int i = 0; i < drops.length; i++) {
      drops[i].fall();
    }
    //Loop through array to use objects.
    for (int i = 0; i < drops.length; i++) {
      drops[i].fall();
    }
  }
  
  //snow
  if ( (weather.contains("Snow")) )
  {
    background(242, 242, 242);
    //Loop through array to use objects.
    for (int i = 0; i < flakes.length; i++) {
      flakes[i].fall();
    }
    //Loop through array to use objects.
    for (int i = 0; i < flakes.length; i++) {
      flakes[i].fall();
    }
  }
  
  fill(0);
  // Display everything
  text("Input: " + input,indent,10);
  text("Zip: " + zip,indent,30);
  text("Current Temperature: " + currTemp, 10, 50);
  text("Today’s high: " + temperature, 10, 70);
  text("Today’s low: " + low, 10, 90);
  text("Forecast: " + weather, 10, 110);
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