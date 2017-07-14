/*
Date: 7-13-17
Written by: Austin Reynolds
Written very quickly as a response to Matt Parker's video regarding Destin Sandlin's video regarding
rolling shutter.
Destin's Video (SmarterEveryDay): https://youtu.be/dNVtMmLlnoE
Matt's Video (standupmaths): https://youtu.be/nP1elMR5qjc
*/

float a = 0;
int period = 50;
int rate = 12;
float omega = TWO_PI / (rate * period);
int propLength, propWidth;
int line = 0;

void setup() {
  size(1920, 1080);
  propLength = height - 100;
  propWidth = propLength / 20;
  frameRate(rate * 10);
  background(51);
}

void draw() {
  loadPixels();
  color[] temp = new color[width * (line + 1)];
  for(int i = 0; i < width * (line + 1); i++) {
    temp[i] = pixels[i];
  }
  background(51);
  pushMatrix();
  translate(width/2, height/2);
  rotate(a);
  rectMode(CENTER);
  fill(255,0,0);
  noStroke();
  rect(0,0,propWidth, propLength);
  fill(0,0,255);
  rect(0,0,propLength, propWidth);
  popMatrix();
  a += omega;
  loadPixels();
  for(int i = 0; i < temp.length; i++) {
    pixels[i] = temp[i];
  }
  updatePixels();
  stroke(255);
  line(0,line+2, width, line+2);
  line ++;
  //saveFrame();
  if(line == height) {noLoop();}
}
