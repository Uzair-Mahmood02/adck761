class Snake {
  PVector pos;
  PVector vel;
  ArrayList<PVector> snake;
  int score;
  int moveX = 0;
  int moveY = 0;

  Snake() {
    pos = new PVector(0, 0);
    vel = new PVector();
    snake = new ArrayList<PVector>();
    score = 0;
  }

  void draw() {
    snake.add(pos.copy());
    pos.x += vel.x*20;
    pos.y += vel.y*20;
    moveX = int(vel.x);
    moveY = int(vel.y);

    pos.x = (pos.x + width) % width;
    pos.y = (pos.y + height) % height;

  if (snake.size() > score) {
      snake.remove(0);
    }

    for (PVector p : snake) {
      if (p.x == pos.x && p.y == pos.y) {
        game = true;
      
      }
    }
  }

  void eat() {
    if (pos.x == food.x && pos.y == food.y) {
      score++;
      if (speed > 5) speed--;
      newFood();
    }
  }

  void show() {
    noStroke();
    fill(0, 255, 0);
    rect(pos.x, pos.y, 20, 20);
    for (PVector p : snake) {
      rect(p.x, p.y, 20, 20);
    }
  }
}

void keyPressed() {
  if (key == 'a' && snake.moveX != 1) {
    snake.vel.x = -1;
    snake.vel.y = 0;
  } else if (key == 'd' && snake.moveX != -1) {
    snake.vel.x = 1;
    snake.vel.y = 0;
  } else if (key == 'w' && snake.moveY != 1) {
    snake.vel.y = -1;
    snake.vel.x = 0;
  } else if (key == 's' && snake.moveY != -1) {
    snake.vel.y = 1;
    snake.vel.x = 0;
  }
}
