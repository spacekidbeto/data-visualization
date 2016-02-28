class Snow {
  float r = random(500);
  float y = random(-height);

  void fall() {
    y = y + 7;
    fill(255);
    ellipse(r, y, 10, 10);

   if(y>height){
   r = random(600);
   y = random(-200);
   }

  }
}