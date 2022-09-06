class JamesBond {

  void bondKills_VS_otherKills(float x, float x1) {
    background(0, 62, 7);
    fill(60, 79, 55);
    textSize(20);
    textAlign(LEFT, CENTER);
    stroke(40, 182, 27);
    strokeWeight(3);
    float ypos = 10; //y position of circles and text
    float dis = 42; // multiplier to determine distance between texts and circles
    for (int y=0; y<table.getRowCount(); y++) {
      //FILM NAME
      fill(0);
      text(table.getString(y, "film"), 10, ypos+y*dis);
      ellipse(300, ypos+y*dis, table.getFloat(y, "bond kills"), table.getFloat(y, "bond kills"));
      //SHOW BOND KILLS for 'b' button
      if (mousePressed && (mouseButton == LEFT) ) {
        fill(255);
        text(table.getInt(y, "bond kills"), 330, (ypos+y*dis)-2);
      }
    }
    //OTHERS KILLS
    for (int y=0; y<table.getRowCount(); y++) {
      fill(135, 94, 94);
      ellipse(430, ypos+y*dis, table.getFloat(y, "others kill"), table.getFloat(y, "others kill"));
      //SHOW OTHER KILLS for 'o' button
      if (mousePressed && (mouseButton == RIGHT) ) {
        fill(255);
        text(table.getInt(y, "others kill"), 472, (ypos+y*dis)-2);
      }
    }
    for (int y=0; y<table.getRowCount(); y++) {
      //SHOW BOTH KILLS FOR 'a' BUTTON
      if (mousePressed && (mouseButton == CENTER) ) {
        fill(255);
        text(table.getInt(y, "others kill"), 472, (ypos+y*dis)-2);
        text(table.getInt(y, "bond kills"), 330, (ypos+y*dis)-2);
      }
    }

    // lines which show whos the actor with the kills
    line(x, 10, x, 155);
    line(x, 165, x, 195);
    line(x, 210, x, 450);
    line(x, 470, x, 520);
    line(x, 535, x, 700);
    line(x, 715, x, 775);
    //LINES CONNECTING TO NAMES
    line(x, 82.5, x1, 200); //x1 is where the line and the name meet
    line(x, 180, x1, 300);
    line(x, 330, x1, 400);
    line(x, 495, x1, 500);
    line(x, 617.5, x1, 600);
    line(x, 745, x1, 700);
    fill(255);

    //ACTOR NAMES FOR ARROWS
    String [] actors = {"Sean Connery", "George Lazenby", "Roger Moore", "Timothy Dalton", "Pierce Brosnan", "Daniel Craig" };
    for (int i=0; i<6; i++) {
      fill(0);
      text(actors[i], x1+10, 200+i*100);
    }
    //COLOUR KEY referenced from processing forum
    textSize(40);
    fill(40, 182, 27);
    for (int i = -1; i < 2; i++) {
      text("BOND KILLS", 920+i, 20);
      text("BOND KILLS", 920, 20+i);
    }
    fill(0);
    text("BOND KILLS", 920, 20);

    fill(40, 182, 27);
    for (int p = -1; p < 2; p++) {
      text("OTHER KILLS", 920+p, 100);
      text("OTHER KILLS", 920, 100+p);
    }
    fill(135, 94, 94);
    text("OTHER KILLS", 920, 100);
    //INSTRUCTIONS

    line(868, 0, 868, height);
    line(868, 135, width, 135);
    textSize(30);
    text("INSTRUCTIONS :", 880, 20, 300, 320);
    text("1) Hold 'q' to interact ", 950, 90, 200, 320);
    textSize(25);
    text("Hold the left mouse button to see BOND KILLS", 950, 220, 250, 300);
    text("Hold the right mouse button to see OTHERS KILLS", 950, 350, 250, 300);
    text("Hold the middle mouse button to see BOTH KILLS", 950, 480, 250, 300);
  }

  //===================================================================================================================

  void filmGrossVSBudget() {
    PFont f = createFont("Arial", 64);
    textFont(f);
    background(169, 0, 0);
    fill(223, 213, 0); // colour for the graph, text  and number
    stroke(5, 73, 165);
    strokeWeight(3);
    textSize(17);
    textAlign(LEFT, CENTER);
    float xpos =330; // x position of graph
    float ypos =20; // start y position of graph
    float bheight=40; // bar height
    //CHART
    for (int i=0; i<table.getRowCount(); i++) {
      //BAR
      rect(xpos, ypos+i*bheight, (table.getFloat(i, "adjusted worldwide gross ($k)")/table.getFloat(i, "adjusted budget ($k)"))*14, bheight);
      //NUMBER
      text(table.getInt(i, "adjusted worldwide gross ($k)")/table.getInt(i, "adjusted budget ($k)"), 280, 40+i*bheight);
      //FILM NAME
      text(table.getString(i, "film"), 10, 40+i*bheight);
    }
    // TITLE
    textSize(30);
    noFill();
    rect(750, 250, 400, 100);
    text("Film Gross ÷ Film Budget", 775, 300);
    text("Hold 'w' and hover over bar to see actor and year", 700, 370, 500, 300);

    //changing text based on mouse pos
    fill(colour);
    textSize(40);
    text(hello, 700, 600);
    //SEAN CONNERY
    if ( mouseX>xpos &&  mouseX<xpos+59.5*14 && mouseY>=ypos && mouseY<=ypos+bheight*4) {
      hello =table.getString(0, "bond actor")+":" + table.getString(0, "Year released")+"-"+table.getString(3, "Year released");
      colour=#ffb300;
    }
    //GEORGE LAZENBY
    else if ( mouseX>xpos && mouseX<xpos+10.3*14 && mouseY>=ypos+bheight*4 && mouseY<=ypos+bheight*5) {
      hello =table.getString(4, "bond actor")+":" + table.getString(4, "Year released");
      colour=#ffb300;
    }
    //ROGER MOORE
    else if ( mouseX>xpos && mouseX<xpos+24*14 && mouseY>=ypos+bheight*5 && mouseY<=ypos+bheight*11) {
      hello =table.getString(5, "bond actor")+":" + table.getString(5, "Year released")+"-"+table.getString(10, "Year released");
      colour=#ffb300;
    }
    //TIMOTHY DALTON
    else if ( mouseX>xpos && mouseX<xpos+5*14 && mouseY>=ypos+bheight*11 && mouseY<=ypos+bheight*13) {
      hello =table.getString(11, "bond actor")+":" + table.getString(11, "Year released")+"-"+table.getString(12, "Year released");
      colour=#ffb300;
    }
    //PIERCE BROSNAN
    else if ( mouseX>xpos && mouseX<xpos+6*14 && mouseY>=ypos+bheight*13 && mouseY<=ypos+bheight*17) {
      hello =table.getString(13, "bond actor")+":" + table.getString(13, "Year released")+"-"+table.getString(16, "Year released");
      colour=#ffb300;
    }
    //DANIEL CRAIG
    else if ( mouseX>xpos && mouseX<xpos+6*14 && mouseY>=ypos+bheight*17 && mouseY<=ypos+bheight*19) {
      hello =table.getString(17, "bond actor")+":" + table.getString(17, "Year released")+"-"+table.getString(18, "Year released");
      colour=#ffb300;
    } else {
      hello ="Actor name and Year :";
      colour = #00b9ff;
    }
  }

  //===================================================================================================================

  void linegraph() {
    float xpos = 90; // x position of axis
    float ypos = 750; // bottom y position of axis
    background(#2E5266FF);
    line(xpos, ypos, width-(xpos-50), ypos);// X-AXIS
    line(xpos, xpos, xpos, ypos); //Y-AXIS
    textSize(25);
    strokeWeight(3);
    for (int i=0; i<table.getRowCount(); i++) {
      //YEARS
      fill(#D3D0CBFF);
      font=createFont("Arial", 25);
      text("YEARS", width/2, ypos+25);
      // VERTICAL LINES
      stroke(#6E8898FF);
      line(xpos+30+i*(1100/19), xpos, xpos+30+i*(1100/19), table.getFloat(i, "adjusted worldwide gross ($k)")/1300);
      //HORIZONTAL LINES
      stroke(50);
      strokeWeight(1);
      line(xpos+3, (table.getFloat(i, "adjusted worldwide gross ($k)")/1300), xpos+30+i*(1100/19), (table.getFloat(i, "adjusted worldwide gross ($k)")/1300));
      //ARROW
      stroke(#9FB1BCFF);
      strokeWeight(3);
      line(xpos+20+i*(1100/19), (table.getFloat(i, "adjusted worldwide gross ($k)")/1300)-20, xpos+30+i*(1100/19), (table.getFloat(i, "adjusted worldwide gross ($k)")/1300));
      line(xpos+30+i*(1100/19), (table.getFloat(i, "adjusted worldwide gross ($k)")/1300), xpos+40+i*(1100/19), (table.getFloat(i, "adjusted worldwide gross ($k)")/1300)-20);
    }
    //INFORMATION TABLE
    noFill();
    textAlign(LEFT);
    rect(421, 539, 753, 200);
    line(980, 539, 980, 739);
    textSize(24); //TEXTSIZE FOR DATA
    text(linetext, 635, 580, 700, 250); // TEXT THAT SHOWS GROSS
    text(linefilm, 635, 620, 700, 250); // TEXT THAT SHOWS FILM
    text(lineactor, 635, 660, 700, 250); // TEXT THAT SHOWS ACTOR NAME
    text(linerating, 635, 700, 700, 250); // TEXT THAT SHOWS RATING
    float a=1; // VERTICAL DISTANCE MOUSE HAS FOR IT TO REGISTER
    textSize(24);
    stroke(0, 0, 200);
    fill(0, 0, 200);
    text("Hold 'e' and hover on horizontal line to see :", 437, 540, 500, 250);
    text("Gross ($k) :", 437, 580, 371, 250); // SHOW GROSS
    text("Film :", 437, 620, 371, 250);//SHOWS PERMANENT FILM
    text("Actor :", 437, 660, 371, 250);//SHOWS PERMANENT ACTOR NAME
    text("Rating out of 10 :", 437, 700, 371, 250);//SHOWS PERMANENT RATING

    //VERTICAL LINES
    textSize(22);
    text("Hold 'e' and hover on vertical lines in the bracket area to see the years (top left)", 990, 550, 180, 250);
    // BRACKET
    line(85, 85, 13, 85);
    line(13, 85, 13, 213);
    line(13, 213, 85, 213);
    //BLUE STROKE TO HIGHLIGHT YEAR
    for (int i=0; i<table.getRowCount(); i++) {
      if (mouseX>=xpos+29+i*(1100/19) && mouseX<=xpos+31+i*(1100/19) && mouseY>=90 && mouseY<=225) {
        stroke(0, 0, 255);
        fill(0, 0, 255);
        line(xpos+29+i*(1100/19), 90, xpos+29+i*(1100/19), ypos);
        textSize(24);
        text(table.getInt(i, "Year released"), xpos+i*(1100/19), 50);
      } else {
        line(0, 0, 0, 0);
      }
    }
    //HORIZONTAL LINES
    for (int i=0; i<table.getRowCount(); i++) {
      if (  mouseX>=xpos && mouseX<= xpos+30+i*(1100/19) && mouseY>=(table.getFloat(i, "adjusted worldwide gross ($k)")/1300)-a
        && mouseY<=(table.getFloat(i, "adjusted worldwide gross ($k)")/1300)+a) {
        linetext=str(table.getInt(i, "adjusted worldwide gross ($k)"));
        linefilm = table.getString(i, "film");
        lineactor = table.getString(i, "bond actor");
        linerating = table.getString(i, "average rating /10");
      }
    }
  }
}
