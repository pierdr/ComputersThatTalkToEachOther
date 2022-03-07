PVector array[] = new PVector[1000];
int now = 0;
color c = color(255,221,175);

final static int cycleTime = 1500;
void setup()
{
  size(256,256);
  for(int i = 0;i<array.length;i++)
  {
    array[i] = new PVector(random(25,width-25),random(25,height-25));
  }
noStroke();
}

void draw()
{
  background(0);
  fill(lerpColor(c,color(0,0,0),map(millis()-now,0,cycleTime,0,1.0)));
  int maxIndex = (int)constrain( map(millis()-now,0,cycleTime,array.length,0), 0 ,array.length);
  for(int i = 0 ; i < maxIndex ;i++)
  {
    PVector tmp = array[i];
    ellipse(tmp.x,tmp.y,25,25);
  }
  //EXECUTE THE CODE INSIDE HERE EVERY cycleTime (in milliseconds)
  if(millis()-now > cycleTime)
  {
    now = millis();
    c = color(random(0,255),random(0,255),random(0,255));
  }
}
