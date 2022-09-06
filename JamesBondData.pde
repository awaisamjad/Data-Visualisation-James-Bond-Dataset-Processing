String hello =""; // text for filmGrossVSBudget()
String linetext="";// gross for linegraph()
String linefilm=""; //film name for linegraph()
String lineactor=""; // actor name for linegraph()
String linerating="";// rating for linegraph()
PFont font;
int colour=255;
Table table;
JamesBond[] Bond = new JamesBond[3];
JamesBond bond;
void setup() {
  background(#2DA8D8FF);
  size(1200, 800);
  smooth(8);
  bond=new JamesBond();
  table = loadTable("JamesBondDataCSV.csv", "header");
  frontpage();
}


void draw() {
  println(mouseX, mouseY);
  if (keyPressed && key =='q') {
    setup();
    bond.bondKills_VS_otherKills(500, 700);
  }

  if (keyPressed && key =='w') {
    setup();
    bond.filmGrossVSBudget();
  }

  if (keyPressed && key =='e') {
    setup();
    bond.linegraph();
  }
  if (keyPressed && key =='b') {
    setup();
  }
}
void frontpage() {
  font = createFont("Georgia", 55);
  fill(#D9514EFF);
  textFont(font);
  textAlign(CENTER);
  textSize(53);
  stroke(#2A2B2DFF);
  strokeWeight(3);
  text("Click on the screen for the buttons to work", width/2, 50);
  line(0, 85, width, 85);
  textSize(50);
  text("To compare bond kills and other kills press 'q' ", width/2, 160);
  line(85, 95, width-85, 95);
  line(85, 200, width-85, 200);
  arc(85, 147.5, 105, 105, radians(90), radians(270), PIE);
  arc(width-85, 147.5, 105, 105, radians(-90), radians(90), PIE);

  text("To compare Film Gross and Film Budget press 'w'", width/2, 350);
  line(45, 278, width-45, 278);
  line(45, 382, width-45, 382);
  arc(45, 330, 105, 105, radians(90), radians(270), PIE);
  arc(width-45, 330, 105, 105, radians(-90), radians(90), PIE);

  text("To access the linegraph press 'e'", width/2, 550);
  line(245, 477.5, width-245, 477.5);
  line(245, 582.5, width-245, 582.5);
  arc(245, 530, 105, 105, radians(90), radians(270), PIE);
  arc(width-245, 530, 105, 105, radians(-90), radians(90), PIE);

  text("To go back to the HomeScreen press 'b'", width/2, 750);
  line(160, 677.5, width-160, 677.5);
  line(160, 782.5, width-160, 782.5);
  arc(160, 730, 105, 105, radians(90), radians(270), PIE);
  arc(width-160, 730, 105, 105, radians(-90), radians(90), PIE);
}
