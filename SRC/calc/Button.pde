class Button {
  //Member variable
  int x, y, w, h;
  color c1, c2;
  char val;
  boolean on;

  //constructor
  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(#A7E046);
    c2 = color(#CD8BFA);
    on = false;
  }

  //Member Methods
  void display() {
    textSize(40);
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h, 50);
    textAlign(CENTER);
    fill(255,255,255);
    text(val, x, y+10);
  }

  void hover(int mx, int my) {
    on = (mx>x-w/2 && mx<x+w/2 && my>y-h/2 && my<y+h/2);
  }
}
