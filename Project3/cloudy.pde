class Cloud {
  int x, y, r;
  float xSpeed;
 
  Cloud(int x_, int y_, int r_, float xSpeed_) {
    x=x_;
    y=y_;
    r=r_;
    xSpeed= xSpeed_;
  }
   
  void update(){
   display();
  drift();
  }
 
  void display() {
    noStroke();
    fill(200,200,200,240);
    ellipse(x, y, r, r); 
    ellipse(x-(r/2), y, r*.8, r*.8);
  }
   
void drift(){
   x+=xSpeed;
   if (x>width || x < 0) xSpeed=xSpeed*-1;
  }  
}

void update(){
 display();   
}
 
void display() {
 stroke(0);
}
   
   