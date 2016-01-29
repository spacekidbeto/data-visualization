import java.util.Scanner;

BufferedReader reader;
final String FILENAME = "alice.txt";
int state;
int max;
int min;
int aliceCount;
char character;
final int draw_letter_state = 0;
final int draw_frequencies_state = 1;
final int alphabet_letters = 26;
final int ascii_offset = 97;
int[] frequencies = new int[alphabet_letters];
int[] palette = new int[alphabet_letters];

void setup() {
  size(420,420);
  state = draw_letter_state;
  prepareFrequencies();
  findMax();
  findMin();
  findAlice();
}

void draw(){
  background(255);
  stroke(255);
  for(int i=0; i< frequencies.length; i++) {
    int multiplier = 1;
    float rectWidth = width / (frequencies.length);
    float ypos = height / (frequencies.length);
    rect((rectWidth * 1), ypos, rectWidth, ypos);
  }
}

void drawPalette(){
  for(int i=0; i< alphabet_letters; ++i){
  palette[i] = color(random(0-255), random(0-255),random(0-255));
  }
}

void drawFrequencies(){
  background(0);
}
void prepareFrequencies() {
  for(int i=0; i< alphabet_letters; ++i){
    frequencies[i] = 0;
  }
    reader = createReader("alice.txt");   
    try{
    int character;
    while ((character = reader.read()) != -1) {
    if (!Character.isAlphabetic(character)) continue;
    char letter = (char)Character.toLowerCase(character);
    frequencies[letter - ascii_offset]++;
    //letterviz.pixels[pixelposition] = pallette[letter - ascioffset];
    //pixelposition++;
    }
    } catch (IOException e){
    e.printStackTrace();
    }
    println(frequencies);
} 

void findMin(){
   min = frequencies[0];  
   for(int i=1; i < frequencies.length;i++) {  
     if(frequencies[i] < min) {  
       min = frequencies[i];  
     }  
   }  
   println(min);  
}

void findMax(){
   max = frequencies[0];  
   for(int i=1; i < frequencies.length;i++) {  
     if(frequencies[i] > max) {  
       max = frequencies[i];  
     }  
   }  
   println(max);  
}

void findAlice(){
  String match = "Alice"; 
  int count = 0;
  Scanner scanner = new Scanner(FILENAME);
  scanner.useDelimiter("[^a-zA-Z]"); // non alphabets act as delimeters
  String word = scanner.next();
  if (word.equalsIgnoreCase(match)){
    count ++;
  }
  println(count);
  aliceCount = count;
}
