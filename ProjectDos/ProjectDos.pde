Walker walker;

ArrayList<Food> foods = new ArrayList<Food>();
final int NUMBER_OF_FOODS = 100;
final int NUMBER_OF_COLORS = 100;
color[] colors = new color[NUMBER_OF_COLORS];

void setup() {
  size(600, 600);
  walker = new Walker(new PVector(10, height / 2));
  for (int i = 0; i < NUMBER_OF_COLORS; ++i) {
    colors[i] = color(random(0, 255), random(0, 255), random(0, 255));
  }
  for (int i = 0; i < NUMBER_OF_FOODS; ++i) {
    PVector l = new PVector(random(0, width), random(0, height));
    color c = colors[(int)random(0, NUMBER_OF_COLORS)];
    foods.add( new Food(l, c) );
  } 
}

void draw() {
  background(255);
  stroke(0);
  line(0, 390, 600, 390);//horizontal line
  line(210, 390, 210, 600);//vertical line
  line(410, 390, 410, 600);//vertical line 2
  walker.walk();
  walker.draw();
  for (int i = foods.size() - 1; i >= 0; --i) {
    Food f = foods.get(i);
    f.draw();
    if (walker.isTouching(f)) {
      walker.eat(f);
      foods.remove(f);
    }
  }
}