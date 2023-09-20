int startX = 150;
int startY = 0;
int endX = 150;
int endY = 0;
int [] coordList = {150,0};
double randColor1 = (Math.random() * 21)-10;
double randColor2 = (Math.random() * 21)-10;
double randColor3 = (Math.random() * 21)-10;
int a = 0;
void setup()
{
  size(300,350);
  strokeWeight(4);
  stroke(144, 31, 242);
  background(5,5,25);
}

void draw()
{
  resetTime();
  //coordinate generator
  while(endY <= 300)
  {
    double tempX = (39 * Math.random()) -20;
    double tempY = (10 * Math.random());
    endY = startY + (int)tempY;
    if(endY < 230)
  {
    endX = startX + (int)tempX;
  } else if(endX < 150)
  {
    endX = startX + abs((int)tempX);
  } else if(endX > 150)
  {
    endX = startX - abs((int)tempX);
  } else if (endX == 150) {
    endX = startX + (int)tempX;
  }
    appendItem(endX,endY,coordList);
    startX = endX;
    startY = endY;
  }
  //Purple lightning
  for(int b = 0; b <coordList.length - 3; b = b + 2)
  {
    randColor1 = (Math.random() * 21)-10;
    randColor2 = (Math.random() * 21)-10;
    randColor3 = (Math.random() * 21)-10;
    filter( BLUR,1);
    strokeWeight(6);
    stroke(195 + (int)randColor1, 35 + (int)randColor1, 235 + (int)randColor1);
    line(coordList[b],coordList[b+1],coordList[b+2],coordList[b+3])
  }
  filter( BLUR,0);
  for(int b = 0; b <coordList.length - 3; b = b + 2)
  {
  strokeWeight(2);
  stroke(250,250,250);
  line(coordList[b],coordList[b+1],coordList[b+2],coordList[b+3]);
  }
  noStroke();
  fill(156, 151, 161);
  ellipse(150,15,90,30);
  while (a<6)
  {
    randColor1 = (Math.random() * 21)-10;
    randColor2 = (Math.random() * 21)-10;
    randColor3 = (Math.random() * 21)-10;
    double randCoords1 = (Math.random() * 61)-30;
    double randCoords2 = (Math.random() * 31)-15;
    fill(156+(int)randColor1, 151+(int)randColor2, 161+(int)randColor3);
    ellipse(150+(int)randCoords1,15+(int)randCoords2,90+(int)(3*randColor1),30+(int)randColor1);
    a++;
  }
  fill(201, 128, 60);
  rect(145,310,10,40);
  fill(211, 138, 70);
  ellipse(150,310,20,20);
}
void mousePressed()
{
  int[] resetCoords = {150,0};
  coordList = resetCoords;
  background(5,5,25);
  a = 0;
  startX = 150;
  startY = 0;
  endX = 150;
  endY = 0;
}

void resetTime()
{
  int[] resetCoords = {150,0};
  coordList = resetCoords;
  background(5,5,25);
  a = 0;
  startX = 150;
  startY = 0;
  endX = 150;
  endY = 0;
}

void appendItem(int xCoord, int yCoord, int[] array)
{
  int [] newArray = new int[array.length +2];
  for (int a =0; a< array.length; a++)
  {
    newArray[a] = array[a];
  }
  newArray[newArray.length - 2] = xCoord;
  newArray[newArray.length - 1] = yCoord;
  coordList= newArray;
}
