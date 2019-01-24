// --------------------------------------------------
import processing.svg.*;
import java.util.*;
import controlP5.*;

// --------------------------------------------------
boolean bExportSVG = false;

// --------------------------------------------------
int resx = 20;
int resy = 10;
float margin = 30;

// --------------------------------------------------
void settings()
{
  size(210*3, 300*3);
}

// --------------------------------------------------
void setup()
{
}

// --------------------------------------------------
void draw()
{
  background(255);
  if (bExportSVG)
  {
    beginRecord(SVG, "data/exports/svg/stripes_"+timestamp()+".svg");
  }

  float stepx = (width-2*margin) / float(resx);    
  float stepy = (height-2*margin) / float(resy);    

  float x=margin, y=margin;
  int i, j;
  for (j=0; j<resy; j++)
  {
    x = margin;
    for (i=0; i<resx; i++)
    {
      pushMatrix();
      translate(x, y);

      noFill();
      stroke(0);
      rectMode(CENTER);
      pushMatrix();
      translate(stepx/2,stepy/2);
       rotate( 0.15*radians( dist(x+stepx/2,y+stepy/2,width/2,height/2) ) );
      rect( 0,0, 0.25*stepx, 0.95*stepy );
      popMatrix();
      
      popMatrix();
      x+=stepx;
    }
    y+=stepy;
  }

  // DÉBUT des commandes de dessin

  // FIN des commandes de dessin

  if (bExportSVG)
  {
    endRecord();
    bExportSVG = false;
  }
}

// --------------------------------------------------
void keyPressed()
{
  if (key == 'e')
  {
    bExportSVG = true;
  }
}

// --------------------------------------------------
String timestamp() 
{
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
