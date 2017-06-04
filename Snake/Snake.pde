// @Pratham Desai
int w = 30;//frame width
int h = 30;//frame height
int tile = 20;//tile size
int vector = 0;
int pointX = 5;
int pointY = 5;
int score;
int r;
int g;
int b;
boolean dead;
ArrayList<Integer> enemyX  = new ArrayList<Integer>();
ArrayList<Integer> enemyY  = new ArrayList<Integer>();
/*0 = down
  1 = up
  2 = right
  3 = left
*/
int[] xVector = {0,0,1,-1};
int[] yVector = {1,-1,0,0};
ArrayList<Integer> xpos = new ArrayList<Integer>();
ArrayList<Integer> ypos = new ArrayList<Integer>();
void setup(){
  size(600, 600);//creates frame
  //width = w*tile
  //height = h*tile
  
  //initial position of snake
  xpos.add(w/2);
  ypos.add(h/2);
 
 
  dead = false;
  
  
  //initializes score
  score = 0;
  
  r = 255;
  g  = 255;
  b = 255;
}

void draw(){
  
 
  for(int i = 0; i<w; i++){
    for(int j = 0; j<h; j++){
    //for random color effects
      /*
      r = (int)random(0,255);
      g = (int)random(0,255);
      b = (int)random(0,255);
     
      */
      fill(r,g,b);//generates colour of rectangles that compose the grid
      rect(i*tile,j*tile,tile,tile);//generates rectangles
    }
  }
if(xpos.size() > 0){
   for(int i = 0; i<xpos.size(); i++){
    fill(0,255,0);//fills shape based on rgb value
    rect(xpos.get(i)*tile, ypos.get(i)*tile, tile, tile);//creates snake
  }

  
}

for(int i =2; i<xpos.size(); i++){
  if(xpos.get(0) == xpos.get(i) && ypos.get(0) == ypos.get(i)){
    dead = true;
    break;
  }
}

if(xpos.get(0)<0 || xpos.get(0) >w || ypos.get(0) <0 || ypos.get(0) >h){
  dead = true;
}

 if(dead == false){
   
   //draws the first point
   fill(0,0,255);
   rect(pointX*tile,pointY*tile,tile,tile);
   
  if(frameCount % 5 == 0){
    xpos.add(0,xpos.get(0) + xVector[vector]);
    ypos.add(0,ypos.get(0) + yVector[vector]);
    
    
    
    if(xpos.get(0) == pointX && ypos.get(0) == pointY){
      score++;
      
      //if you hit the point, then it generates a new one randomly
      pointX = (int)random(0,w);
      pointY = (int)random(0,h); 
    }else{
      xpos.remove(xpos.size()-1);
      ypos.remove(ypos.size()-1);
    }
  }
    
}else{
  
  fill(0);
  textSize(64);
  fill(0,0,0);
  text("GAME OVER", w*tile/4,h*tile/2);
  text(score,(w*tile/4) + 160,(h*tile/2) +100);
  
}
  
}

void keyPressed(){
  
  int newVector = vector;
  
  if(keyCode == UP && vector != 0){
    newVector = 1;
  }else if(keyCode == DOWN && vector != 1){
    newVector = 0;
  }else if(keyCode == RIGHT && vector != 3){
    newVector = 2;
  }else if(keyCode == LEFT && vector != 2){
    newVector = 3;
  }
  
  vector = newVector;
}