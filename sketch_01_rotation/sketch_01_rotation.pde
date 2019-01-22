// Sketch inspiré de https://turtletoy.net/turtle/f8526463e9
// --------------------------------------------------
import processing.svg.*;
import java.util.*;

// --------------------------------------------------
boolean bExportSVG = false;

// --------------------------------------------------
int nbPoints = 3;
float nbFigures = 62;
float angleRotation = PI/10;
float nbTours = 3;
float rayonDepart = 10;
float croissance = 5;

// --------------------------------------------------
void settings()
{
  size(210*3, 300*3);
}

// --------------------------------------------------
void draw()
{
  background(255);
  if (bExportSVG)
  {
    beginRecord(SVG, "data/exports/svg/stripes_"+timestamp()+".svg");
  }

  
  // DÉBUT des commandes de dessin
  noFill();
  stroke(0);

  pushMatrix();
  translate(width/2, height/2);


  for (int n=0; n<nbFigures; n++)
  {
    pushMatrix();
    rotate( map( sin(nbTours*n/nbFigures*TWO_PI),-1,1, -angleRotation,angleRotation) );
    circle(nbPoints, rayonDepart + croissance*n);
    popMatrix();
  }

  popMatrix();

  // FIN des commandes de dessin

  if (bExportSVG)
  {
    endRecord();
    bExportSVG = false;
  }
}

// --------------------------------------------------
void circle(int nb, float radius)
{
  beginShape();
  for (int i=0; i<nb; i++)
  {
    float angle = -PI/2+float(i)*TWO_PI/float(nb);
    vertex( radius*cos(angle), radius*sin(angle) );
  }
  endShape(CLOSE);
}

// --------------------------------------------------
String timestamp() 
{
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
