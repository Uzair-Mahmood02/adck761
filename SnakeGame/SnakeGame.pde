int grid = 20; //How big each grid square will be
PVector food;
int speed = 10;
boolean game= true;

Snake snake;

void setup() {
  size(1000, 1000);
  snake = new Snake();
  food = new PVector();
  newFood();
  //frameRate(8);
}

void draw() {
  background(0);
  fill(255);
  if (game == false) {

    frameRate(10);
      snake.draw();
   
  
    snake.show();
    snake.eat();
    fill(255, 0, 0);
    rect(food.x, food.y, grid, grid);
    textAlign(LEFT);
    textSize(15);
    fill(255);
    text("Score: " + snake.score, 10, 20);
  } else {
    textSize(25);
    textAlign(CENTER, CENTER);
    text("Snake Game\n Controls: W A S D", width/2, height/2);
  }
}

void newFood() {
  food.x = floor(random(width));
  food.y = floor(random(height));
  food.x = food.x %grid * grid;
  food.y = food.y % grid * grid;
}

void mousePressed() {
  if (game == true) {
    snake = new Snake();
    newFood();
    speed = 10;
    game = false;
  }
}
