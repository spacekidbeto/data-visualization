Walker walker;

ArrayList<Food> foods = new ArrayList<Food>();
final int NUMBER_OF_FOODS = 100;
final int NUMBER_OF_COLORS = 10;
color[] colors = new color[NUMBER_OF_COLORS];

void setup() {
  size(900, 600);
  walker = new Walker(new PVector(0, height / 2));
  for (int i = 0; i < NUMBER_OF_COLORS; ++i) {
    colors[i] = color(random(0, 255), random(0, 255), random(0, 255));
  }
  for (int i = 0; i < NUMBER_OF_FOODS; ++i) {
    PVector l = new PVector(random(0, width), random(0, 380)); //set where they appear
    color c = colors[(int)random(0, NUMBER_OF_COLORS)];
    foods.add( new Food(l, c) );
  } 
}

void draw() {
  background(255);
  stroke(0);
  
  //text of structure name
  fill(0);
  text("Bag", 90, 410);
  text("Set", 290, 410);
  text("Tree", 490, 410);
  text("Stack", 690, 410);
  
  //set paramateres of lines
  line(0, 390, 900, 390);//horizontal line
  line(210, 390, 210, 600);//vertical line
  line(410, 390, 410, 600);//vertical line 2  
  line(610, 390, 610, 600);//vertical line 3
  line(810, 390, 810, 600);//vertical line 2
  walker.walk();
  walker.draw();
  for (int i = foods.size() - 1; i >= 0; --i) {
    Food f = foods.get(i);
    f.draw();
    if (walker.isTouching(f)) {
      walker.eat(f);
      foods.remove(f);
    }
    if ((walker.location.x > 0) && (walker.location.x < 90) || (walker.location.x > 490) && (walker.location.x < 690)) {
      //data.remove(f);
      if (walker.isTouching(f)) {
      walker.putBack(f);
      foods.add(f);
    }
    }
  }
  //zones names
  fill(0);
  text("Add", 90, 30);
  text("Delete", 290, 30);
  text("Add", 490, 30);
  text("Delete", 690, 30);
}