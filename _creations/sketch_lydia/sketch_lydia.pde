// --------------------------------------------------
import processing.svg.*;
import java.util.*;

// --------------------------------------------------
boolean bExportSVG = false;
int nombreEllipses = 40;
int nombreLignes =0;

// --------------------------------------------------
void settings()
{
  size(800, 800);
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
  // DÉBUT des commandes de dessin
  translate(width/2, height/2);
  pushMatrix();
  ellipseMode(CORNER);
  for (int i=0; i<nombreEllipses; i++)
  {
    float r = 300;
    float x = 0;
    while(r>0)
    {
      ellipse(30+x, 0, r, 9); // x,y,largeur,hauteur
      r -= random(100,200);
    }
    rotate( TWO_PI / nombreEllipses );
  }
  popMatrix();

  for (int i=0; i<nombreLignes; i++)
  {
    line(0, 0, random(350, 400), 5);
    rotate( TWO_PI / nombreLignes );
  }

  // FIN des commandes de dessin

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
