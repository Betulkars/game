int frogX = 350; 
int frogY = 682;
int score=0;
int life=3;
Car car1; 
Car car2; 
Car car3; 
Car car4; 
Car car5; 
Car car6; 

//Creating a Car Object
class Car
{
  int xPos;
  int yPos; 
  int size; 
  int speed;

  //Constructor
  Car(int xpos, int ypos, int carSize, int carSpeed)
  {
    xPos = xpos; 
    yPos = ypos; 
    speed = carSpeed;
    size = carSize; 
    //rect(x, y, length, width)
    fill(0, 255, 0); 
    rect(xPos, yPos, carSize, 50);
    
  }  
  
  //Method to move car to the right
  void driveRight()
  {
    xPos += speed; 
    if(xPos > height){
      xPos = 0; 
    }    
  }
 
 //Method to move car to the left
  void driveLeft()
  {
    xPos -= speed; 
    if(xPos < 0){
      xPos = 700; 
    } 
  }
  
  //display new car in their new location
  void display() 
  {
    fill(0,0,0);
    ellipse(xPos+size/4,yPos+40,20,25);
    ellipse(xPos+3*size/4,yPos+40,20,25);
    fill(255);
    ellipse(xPos+size/4,yPos+40,10,15);
    ellipse(xPos+3*size/4,yPos+40,10,15);
   fill (139,299,129,129);
    rect(xPos, yPos, size, 40,4);
    fill(35,144,255);
    rect(xPos+size/8,yPos+5,size/1.40,10,2);
   
    
  }
  
}

void setup()
{
  size(700,700); 
  
  //Make cars
  car1 = new Car( 100, 70, 100,7);
  car2 = new Car( 350,160, 95,9 );
  car3 = new Car( 150, 250, 150,12); 
  car4 = new Car( 50, 340, 200, 6); 
  car5 = new Car( 0, 450, 50, 10); 
  car6 = new Car( 450, 570, 100, 8);
}

void draw()
{
  //background(red, green, blue) 
  background(167); 
  noStroke();
  //finish line
  fill(255,255,0); 
  rect(0,0,width,60); 
  //fill(0,255,0);
  fill(139,69,19);
  text("Finish Line", 550, 50); 
  textSize(20); 
  //fill(142,55,60);
   fill(139,69,19);
  text("Score="+score,30,20);
  
  
  //start line
  fill(255, 0,255); 
  rect(0,width-50,height,50); 
  fill(139,0,19);
  text("Start Line", 550, 680); 
  textSize(20); 

  
  //frog beginning coordinates 
  fill(0,255,0); 
  ellipse(frogX,frogY,35,35); 
  fill(255);
  ellipse(frogX-10,frogY-15,17,17);
  ellipse(frogX+9,frogY-15,17,17);
  fill(0);
  ellipse(frogX-10,frogY-15,7,7);
  ellipse(frogX+9,frogY-15,7,7);
 
  keepFrogInCanvas(); 
   
  //even cars go right
  //odd cars go right
  car1.driveLeft(); 
  car1.display(); 
  fill(255);
  rect(20,140,80,5);
  rect(130,140,80,5);
  rect(240,140,80,5);
  rect(350,140,80,5);
  rect(460,140,80,5);
  rect(580,140,80,5);
  
  car2.driveRight(); 
  car2.display(); 
  fill(255);
  rect(20,225,80,5);
  rect(130,225,80,5);
  rect(240,225,80,5);
  rect(350,225,80,5);
  rect(460,225,80,5);
  rect(580,225,80,5);
  
  car3.driveLeft(); 
  car3.display(); 
  fill(255);
  rect(20,310,80,5);
  rect(130,310,80,5);
  rect(240,310,80,5);
  rect(350,310,80,5);
  rect(460,310,80,5);
  rect(580,310,80,5);
  
  car4.driveRight(); 
  car4.display(); 
  fill(255);
  rect(20,420,80,5);
  rect(130,420,80,5);
  rect(240,420,80,5);
  rect(350,420,80,5);
  rect(460,420,80,5);
  rect(580,420,80,5);
  
  car5.driveLeft(); 
  car5.display(); 
  fill(255);
  rect(20,530,80,5);
  rect(130,530,80,5);
  rect(240,530,80,5);
  rect(350,530,80,5);
  rect(460,530,80,5);
  rect(580,530,80,5);

  car6.driveRight(); 
  car6.display();
  
  //Checks that frog does not touch any of the cars 
 if(intersects(car1)||intersects(car2)||intersects(car3) ||intersects(car4)||intersects(car5)||intersects(car6))
    {
      resetFrog(); 
      score=0;
      life-=1;
       }
    

  //finish the game
  gameFinishBanner(); 

}

//Puts frog to starting position
void resetFrog()
{
  frogX = 300; 
  frogY = 682;
}

//Text shows up
void gameFinishBanner()
{
  if(frogY < 50){
    fill(0,0,255);
    rect(0,0, width, height);
    fill(255,0,0); 
; 
    text("YOU WIN!!!",300, 300); 
    textSize(100); 
  }
}

//Checks if frog and car intersects
boolean intersects(Car car) 
{
  //start/finish line   -------- Cars
  if ((frogY > car.yPos && frogY < car.yPos+100) &&(frogX > car.xPos && frogX < car.xPos+car.size))
      return true;
  else 
    return false;
    
}

//make sure frog is always in boundary of the canvas 
void keepFrogInCanvas()
{

  if(frogX > 700){
    frogX = 360; 
  }
  if(frogY > 700){
    frogY = 670; 
  }
  if(frogX < 25){
    frogX = 25; 
  }
  if(frogY < 25){
    frogY = 25; 
  }
}

//gives the frog movement
void keyPressed()
{
  if(key == CODED){
      if(keyCode == UP)
      {
       frogY-=50;
        score+=10; 
        fill(0,255,0); 
        ellipse(frogX,frogY,60,60); 
        ellipse(frogX-10,frogY-15,25,25);
        ellipse(frogX+9,frogY-15,25,25);
        fill(0);
        ellipse(frogX-10,frogY-15,15,15);
        ellipse(frogX+9,frogY-15,15,15);
         
      }
      else if(keyCode == DOWN)
      {
        frogY+=50; 
      }
      else if(keyCode == RIGHT)
      {
        frogX+=50; 
      }
      else if(keyCode == LEFT)
      {
        frogX-=50; 
      }
   }
   
} 
