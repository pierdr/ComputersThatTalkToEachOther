//http://api.weatherapi.com/v1/current.json?key=220fe81ccab14ca69e835427221703&q=San Francisco&aqi=no
import processing.net.*;

//SAVE data inside this json object
JSONObject json;

//Draw the weather icon with description
PImage weatherIcon;
String weatherNowDescr = "";

//SAVE the current temperature 
float feelslike_c = 0.0;


//These two colors are used for the background
color cold = color(0,128,255);
color warm = color(255,115,0);

void setup()
{
  size(256,256);
  json = loadJSONObject("http://api.weatherapi.com/v1/current.json?key=220fe81ccab14ca69e835427221703&q=San%20Francisco&aqi=no");
  println(json);
  JSONObject current = json.getJSONObject("current");
  JSONObject condition = current.getJSONObject("condition");
  String imageName = condition.getString("icon");
  weatherNowDescr = condition.getString("text");
  weatherIcon = loadImage("http:"+imageName);
  feelslike_c = current.getFloat("feelslike_c");
  textAlign(CENTER);
  imageMode(CENTER);
}


void draw()
{
  background(lerpColor(cold,warm,map(feelslike_c,0,40,0,1.0)));
  text(weatherNowDescr,width/2, height*0.75);
  image(weatherIcon,width/2,height/2);
}
