// --------------------------------------------------
import processing.svg.*;
import java.util.*;

// --------------------------------------------------
boolean bExportSVG = false;
float angledor = TWO_PI/(1+(1+sqrt(5))/2);
float constante=10;

// --------------------------------------------------
void settings()
{
  size(500, 500);
  noLoop();
}

// --------------------------------------------------
void draw()
{
  background(255);
  if (bExportSVG)
  {
    beginRecord(SVG, "data/exports/svg/export_"+timestamp()+".svg");
  }
  noFill();

  float x=250;
  float y=250;
  for (int a=0; a<1000; a++) {
    float r= constante*sqrt(a);
    float e= random(2, 20);
    x+=cos(angledor*a)*r;
    y+=sin(angledor*a)*r;
    stroke(e);
    line (x, y, 250, y);
    //point (x,y);
  }
  if (bExportSVG)
  {
    endRecord();
    bExportSVG = false;
  }
}

// --------------------------------------------------
String timestamp() 
{
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

// --------------------------------------------------
void keyPressed()
{
  if (key == 'e')
  {
    bExportSVG = true;
    redraw();
  }
}
