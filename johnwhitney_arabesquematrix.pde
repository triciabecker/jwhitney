static float deg = PI/180;

float start = 0,
      end = 1/60.0, 
      radius = 85,
      theta = 0,
      xcenter,
      ycenter;

int  alphaValue = 0,
     numPoints = 360,
     frame = 0,
     ilength = 170,
     startTime;

void setup()
{
  size(1000,1000);
  radius = height*.88/2;
  xcenter = width/2;
  ycenter = height/2;
  frameRate(24);
  noStroke();
  fill(255);
  startTime = millis();
}

void draw()
{
  background(0);
  
  if (millis() - startTime < 9900){
    animation();
  } else if (millis() - startTime > 9899 && millis() - startTime < 21999){
    animation2();
  } else if (millis() - startTime > 21999 && millis() - startTime < 53499){
    animation3();
  } else if (millis() - startTime > 53300) {
    finalAnimation();
  }
}

void animation(){
  float ftime = millis() * .0001;
  float step = start + (ftime * (end - start));

  for (int i = 0; i < numPoints; i++)
  {
    float ratio = i/(float)numPoints;
    float r = 3*radius;
    float a = -90 + 360 * ratio;
    float x = cos(a*deg) * ratio + i*step*r;
    int ix = (int) (xcenter - (r/2) + int(x+r/2)%Math.round(r));
    int iy = int( ycenter + sin(a*deg) * radius );
    fill(255, 255, 255);
    ellipse(ix, iy, 10,10);
  }
}

void animation2() {
    
for (int i = 0; i < numPoints; i++)
  {
    float ftime = second() * (i/(float)numPoints) * 0.015;
    float step = cos(start + (ftime * (end - start)));
    theta+= (PI/90) % (2*PI) * step * i;
    float x = (1000 - (millis() / 10)) * cos(theta) + 500;
    float y = (1000 - (millis() / 10)) * cos(theta ) * sin(theta) + 500;
    fill(255, 255, 255);
    ellipse((int) x, height-(int) y, 15, 15);
  }
}

void animation3() {
  for (int i = 0; i < numPoints; i++)
  {
    float ftime = second()*(i/(float)numPoints) * 0.015;
    float step = cos(start + (ftime * (end - start)));
    theta+= (PI/90) % (2*PI) * step * i;
    float x = (1800 - (millis() / 30)) * cos(theta) + 500;
    float y = (1800 - (millis() / 30)) * cos(theta) * sin(theta) + 500;
    fill(255, 255, 255);
    ellipse((int) x, height-(int) y, 15, 15);
  } 
}

void finalAnimation() {
  textSize(32);
  fill(255,255,255, alphaValue);
  textAlign(CENTER);
  text("E N D", xcenter, ycenter + 10);
  
  if (alphaValue < 255) {
    alphaValue++;
  }
}
