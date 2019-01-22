// --------------------------------------------------
import processing.svg.*;
import java.util.*;

// --------------------------------------------------
boolean bExportSVG = false;

// --------------------------------------------------
void settings()
{
  size(300*3, 210*3);
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
