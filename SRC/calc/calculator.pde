//Bridger Wright | November 2022 | calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[13];
String dVal = "0.0";
float l, r, result;
char op = ' ';
boolean left = true;

void setup() {
  size(310, 560);
  background(#CC9BFF);
  numButtons[0] = new Button(40, 290, 60, 60, '7');
  numButtons[1] = new Button(40, 370, 60, 60, '4');
  numButtons[2] = new Button(40, 450, 60, 60, '1');
  numButtons[3] = new Button(115, 450, 60, 60, '2');
  numButtons[4] = new Button(190, 450, 60, 60, '3');
  numButtons[5] = new Button(115, 290, 60, 60, '8');
  numButtons[6] = new Button(190, 290, 60, 60, '9');
  numButtons[7] = new Button(115, 370, 60, 60, '5');
  numButtons[8] = new Button(190, 370, 60, 60, '6');
  numButtons[9] = new Button(115, 525, 60, 60, '0');


  //other
  opButtons[0] = new Button(265, 450, 60, 60, '±');
  opButtons[1] = new Button(265, 290, 60, 60, '-');
  opButtons[2] = new Button(265, 370, 60, 60, '+');
  opButtons[3] = new Button(225, 525, 135, 60, '=');
  opButtons[4] = new Button(40, 150, 60, 60, 'C');
  opButtons[5] = new Button(115, 150, 60, 60, 's');
  opButtons[6] = new Button(190, 150, 60, 60, '%');
  opButtons[7] = new Button(265, 150, 60, 60, '/');
  opButtons[8] = new Button(265, 220, 60, 60, '*');
  opButtons[9] = new Button(190, 220, 60, 60, '.');
  opButtons[10] = new Button(40, 220, 60, 60, '⁹');
  opButtons[11] = new Button(115, 220, 60, 60, '√');
  opButtons[12] = new Button(40, 525, 60, 60, '³');
}

void draw() {
  background(#FF8989);
  updateDisplay();
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}
void keyPressed() {
  println("key:" + key);
  println("keycode:" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);//this is #1
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);//#2
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);//#3
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);//#4
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);//#5
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);//#6
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);//#7
     } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);//#8
     } else if (keyCode == 57 || keyCode == 105) {
       handleEvent("9", true);//#0
        } else if (keyCode == 48|| keyCode == 96) {
    handleEvent("0", true);//#0
  } else if (keyCode == 107) {//+
    handleEvent("+", false);
  } else if (keyCode == 109) {//-
    handleEvent("-", false);
  } else if (keyCode == 61) {//=
    handleEvent("=", false);
  } else if (keyCode == (106)) {//*
    handleEvent("*", false);
  } else if (keyCode == (111)) {//÷
    handleEvent("/", false);
  } else if (keyCode == (111)) {//÷
    handleEvent("/", false);
  } else if (keyCode == (67)) {//clear
    handleEvent("C", false);
  } else if (keyCode == 46 || keyCode == 110) {//decimal
  handleEvent(".",false);
  }
}

void handleEvent(String val, boolean num) {
  if (num && dVal.length() < 7) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0.0";
    l = 0.0;
    r = 0.0;
    left = true;
    op = ' ';
  } else if (val.equals("+")) {
    op = '+';
    dVal = "0.0";
    left = false;
  } else if (val.equals("-")) {
    op = '-';
    dVal = "0.0";
    left = false;
  } else if (val.equals("=")) {
    perfromCalculation();
  } else if (val.equals("*")) {
    op = '*';
    dVal = "0.0";
    left = false;
  } else if (val.equals("/")) {
    op = '/';
    dVal = "0.0";
    left = false;
  } else if (val.equals(".")) {
    if (dVal.contains(".") == false) {
      dVal += ".";
    }
  }
}

void updateDisplay() {
  rectMode(CENTER);
  rect(width/2, 60, width-10, 100, 30);
  if (dVal.length()< 4) {
    textSize(45);
  } else if (dVal.length() < 5) {
    textSize(38);
  } else if (dVal.length() < 6) {
    textSize(31);
  } else {
    textSize(24);
  }
 
  fill(255,255,255);
  ellipse(130,45,35,50);//eyes
  ellipse(160,45,35,50);
  fill(0);
  ellipse(130,45,15,20);//pupils
  ellipse(160,45,15,20);
  fill(#A75858);
  strokeWeight(3);
arc(145, 75, 100, 70, 0, PI+0, 5);//smile
 fill(#9BD4FF);
  text(dVal, width-50, 100);
}



void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      handleEvent(str(numButtons[i].val), true);
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val== 'C') {
      handleEvent("C", false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      handleEvent("-", false);
    } else if (opButtons[i].on && opButtons[i].val == '*') {
      handleEvent("*", false);
    } else if (opButtons[i].on && opButtons[i].val == '/') {
      handleEvent("/", false);
    } else if (opButtons[i].on && opButtons[i].val == '=' ) {
      perfromCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (left) {
        l=l*-1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val=='s') {
      if (left) {
        l=sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val=='√') {
      if (left) {
        l=sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val=='³') {
      if (left) {
        l=(l*l*l);
        dVal = str(l);
      } else {
        r = (r*r*r);
        dVal = str(r);
      }
      } else if (opButtons[i].on && opButtons[i].val=='⁹') {
      if (left) {
        l=(l*l*l*l*l*l*l*l*l);
        dVal = str(l);
      } else {
        r = (r*r*r*r*r*r*r*r*r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val=='%') {
      if (left) {
        l=(100*l);
        dVal = str(l);
      } else {
        r = (100*r);
        dVal = str(r);
      }
    }
    println(" l:" + l + " Op:" + op + " R:" +r + " Result:" + result + " left:" +left);
  }
}

void perfromCalculation() {
  if (op =='+') {
    result = l+r;
  } else  if (op =='-') {
    result =l - r ;
  } else  if (op== '*') {
    result =l * r;
  } else  if (op== '/') {
    result = l / r;
  }
  dVal = str(result);
  l = result;
  left = true;
}
