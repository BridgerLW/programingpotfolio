//Bridger Wright |oct 25 2022 | car tester
Car C1;
Car C2;
Car[] cars = new Car [50];

void setup() {
  size(displayWidth,displayHeight);
  C1 = new Car();
  C2 = new Car();
  for(int i=0; i<cars.length; i++) {
  cars[i] = new Car();
  }
}

void draw() {
background(155);
C1.display();
C1.drive();
C2.display();
C2.drive();
  for(int i=0; i<cars.length; i++) {
  cars[i].display();
  cars[i].drive();
  }
  
 
  //line(mouseX,mouseY,-5,-500);
  //line(mouseX,mouseY,500,5);
  //line(mouseX,mouseY,5,500);
  //line(mouseX,mouseY,500,500);
  // ellipse(mouseX,mouseY,30,30);
  //fill(255,255,255);
  //strokeWeight(5);
  //stroke(0);
  //noCursor();

}
