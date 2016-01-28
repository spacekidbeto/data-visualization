BufferedReader reader;
final String FILENAME = "alice.txt";
int state;
char character;
final int draw_letter_state = 0;
final int draw_frequencies_state = 1;
final int alphabet_letters = 26;
final int ascii_offset = 97;
int[] frequencies = new int[alphabet_letters];

void setup() {
  size(420,420);
  state = draw_letter_state;
  prepareFrequencies();
}

void draw(){
  if(state == draw_letter_state){
    
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
  
}

void findMax(){
  
}

void findAlice(){
  
}
