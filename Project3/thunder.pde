class Thunder {

  void lightning(){ 
    int xs = round(random(500));//xstar
    int xe = 50;//xend
    int ys = 0;//ystart
    int ye = 0;//yend
    //length of bolt
    while (ye < 500){
      xe = (xs-50) + round(random(80));//bolt direction
      stroke (255);
      line (xs, ys, xe, ye);
      ys = ye;   
      ye += round(random(50));   
      xs = xe;   
    }
  }
}