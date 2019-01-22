// Sketch inspiré de https://turtletoy.net/turtle/f8526463e9

// --------------------------------------------------
import processing.svg.*;
import java.util.*;
import controlP5.*;

// --------------------------------------------------
boolean bExportSVG = false;
ControlP5 cp5;

// --------------------------------------------------
int nbPoints = 3;
float nbFigures = 62;
float angleRotation = 0.07;
float nbTours = 2;
float rayonDepart = 10;
float croissance = 5;

// --------------------------------------------------
void settings()
{
  size(210*3, 300*3);
}

// --------------------------------------------------
void setup()
{
  initControls();
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
    rotate( map( sin(nbTours*n/nbFigures*TWO_PI), -1, 1, -angleRotation, angleRotation) );
    
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

// --------------------------------------------------
void initControls()
{

  cp5 = new ControlP5(this);
  Group groupGlobals = cp5.addGroup("Sketch rotation").setBackgroundHeight(320).setPosition(5, 20).setBarHeight(20).setWidth(400).setBackgroundColor(color(0, 190));
  groupGlobals.getCaptionLabel().getStyle().marginTop = 6;

  int cp5_height = 18;
  int wSlider = groupGlobals.getWidth()-70;
  
  cp5.begin(5, 5);
  cp5.setBroadcast(false);
  cp5.addSlider("nbPoints").setHeight(cp5_height).setWidth(wSlider).setLabel("nb points").setGroup(groupGlobals).setRange(3, 10).setNumberOfTickMarks(10-3).setValue(nbPoints).linebreak();
  cp5.addSlider("nbFigures").setHeight(cp5_height).setWidth(wSlider).setLabel("nb figures").setGroup(groupGlobals).setRange(1, 100).setNumberOfTickMarks(100).setValue(nbFigures).linebreak();
  cp5.addSlider("nbTours").setHeight(cp5_height).setWidth(wSlider).setLabel("nb tours").setGroup(groupGlobals).setRange(1, 5).setNumberOfTickMarks(5).setValue(nbTours).linebreak();
  cp5.addSlider("angleRotation").setHeight(cp5_height).setWidth(wSlider).setLabel("rotation").setGroup(groupGlobals).setRange(0, PI/2).setValue(angleRotation).linebreak();
  cp5.addSlider("rayonDepart").setHeight(cp5_height).setWidth(wSlider).setLabel("rayon depart").setGroup(groupGlobals).setRange(5, 100).setValue(rayonDepart).linebreak();
  cp5.addSlider("croissance").setHeight(cp5_height).setWidth(wSlider).setLabel("croissance").setGroup(groupGlobals).setRange(3, 20).setValue(croissance).linebreak();


  cp5.setBroadcast(true);
  cp5.end();
}
