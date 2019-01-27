// --------------------------------------------------
import processing.svg.*;
import java.util.*;

// --------------------------------------------------
boolean bExportSVG = false;

// --------------------------------------------------
void settings()
{
  size(300*4, 210*4);
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

  // DÉBUT des commandes de dessin
  noFill();
  rosace(28,width/2,height/2,50,100);
  rosace(12,width/2,height/2,320,10);
  rosace(12,width/2,height/2,300,50);
  
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

// --------------------------------------------------
void rosace(int nbTriangles, float x, float y, float decalage, float taille)
{
  pushMatrix();
  translate(x, y);
  for (int i=0; i<nbTriangles; i++)
  {
    pushMatrix();
    rotate(i*TWO_PI/nbTriangles);
    translate(0,-decalage);
    triangle(-taille,0,taille,0,0,-taille*2);
    popMatrix();
  }
  popMatrix();
}
