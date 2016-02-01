BufferedReader reader;
final int letter_viz_state = 0;
final int freq_graph_state = 1;
final String filename = "alice.txt";
final int ascii_offset = 97;
final int alphabet = 26;
int state;
String alice = "";
int aliceFreq = 0;
int maxFreq;
int minFreq;
int character = 0;
int pixelpos = 0;
char letter;
PImage letterViz;
int[] freqs = new int[alphabet];
color[] palette = new color[alphabet];

void setup() {
  size(400, 400);
  state = letter_viz_state;
  readText();
  setPalette();
  findMin();
  findMax();
  findAlice();
  setPixelViz();
  //setHighlight();
}

void draw() {
  if (state == letter_viz_state) {
    drawLetterViz();
  } else {
    drawLetterGraph();
  }
}

void mousePressed() {
  state = (state + 1) % 2;
}

void drawLetterViz() {
  background(0);
  image(letterViz, 0, 0);
}

void drawLetterGraph() {
  background(254);
  for (int i = 0; i<freqs.length; ++i) {
    fill(palette[i]);
    text(char(i + ascii_offset), (i + 1) * 10 + 3, 280);
    textAlign(LEFT, TOP);
    int size = (int)map(freqs[i], 0, 14000, 0, 280);
    rect((i + 1) * 10, 280 - size, 10, size);
    fill(0);
  }
  
  text("a ="+freqs[0], 300,5);
  text("b ="+freqs[1], 300,15);
  text("c ="+freqs[2], 300,25);
  text("d ="+freqs[3], 300,35);
  text("e ="+freqs[4], 300,45);
  text("f ="+freqs[5], 300,55);
  text("g ="+freqs[6], 300,65);
  text("h ="+freqs[7], 300,75);
  text("i ="+freqs[8], 300,85);
  text("j ="+freqs[9], 300,95);
  text("k ="+freqs[10], 300,105);
  text("l ="+freqs[11], 300,115);
  text("m ="+freqs[12], 300,125);
  text("n ="+freqs[13], 300,135);
  text("o ="+freqs[14], 300,145);
  text("p ="+freqs[15], 300,155);
  text("q ="+freqs[16], 300,165);
  text("r ="+freqs[17], 300,175);
  text("s ="+freqs[18], 300,185);
  text("t ="+freqs[19], 300,195);
  text("u ="+freqs[20], 300,205);
  text("v ="+freqs[21], 300,215);
  text("w ="+freqs[22], 300,225);
  text("x ="+freqs[23], 300,235);
  text("y ="+freqs[24], 300,245);
  text("z ="+freqs[25], 300,255);
  text("The word Alice appears "+aliceFreq+" times", 0, 300);
  text("The highest frequency was "+maxFreq+" times", 0, 313);
  text("The lowest frequency was "+minFreq+" times", 0, 326); 
}

void setPalette() {
  for (int i = 0; i < alphabet; ++i) {
    palette[i] = color(random(255), random(255), random(255));
  }
}

void setPixelViz() {
  letterViz = createImage(400, 400, RGB);
  letterViz.loadPixels();
  reader = createReader(filename);
  try {
    while ((character = reader.read()) != -1 && pixelpos < (letterViz.height * letterViz.width)) {
      if (Character.isAlphabetic(character)) {
        char letter = (char)Character.toLowerCase(character);
        letterViz.pixels[pixelpos] = palette[letter - ascii_offset];
      } 
      else 
      {
        letterViz.pixels[pixelpos] = color(0);
      }
      pixelpos++;
    }
  } 
  catch (IOException e) {
    println("Could not read file try again punk");
    e.printStackTrace();
  }
  letterViz.updatePixels();
}

void readText() {
  for(int i=0; i< alphabet; ++i){
    freqs[i] = 0;
  }
    reader = createReader("alice.txt");   
    try{
    while ((character = reader.read()) != -1) {
    if (!Character.isAlphabetic(character)) continue;
    char letter = (char)Character.toLowerCase(character);
    freqs[letter - ascii_offset]++;
    }
    } catch (IOException e){
    e.printStackTrace();
    }
}

void findAlice(){
  BufferedReader reader2 = createReader(filename);
  character = 0;
  while (character != -1) {
    try {
      character = reader2.read();
    } 
    catch (IOException e) {
      println("Could not read file try again punk");
      e.printStackTrace();
    }
    if (!Character.isAlphabetic(character))
    {
      if (alice.compareTo("alice") == 0)
      {
        aliceFreq++;
      }
      alice = "";
      continue;
    }
    letter = (char)Character.toLowerCase(character);
    alice += letter;
  }
}

void findMax() {
  maxFreq = freqs[0];
  for (int i = 1; i < freqs.length; i++)
  { 
    if (freqs[i] > maxFreq)
    {
      maxFreq = freqs[i];
    }
  }
}

void findMin() {
  minFreq = freqs[0];
  for (int i = 1; i < freqs.length; i++)
  { 
    if (freqs[i] < minFreq)
    {
      minFreq = freqs[i];
    }
  }
}
