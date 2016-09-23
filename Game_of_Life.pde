//-------------------------------------------------------------------------------------------------//
//Editor: Gian Miguel Del Mundo                                                                    //
//Creation date: 3 June 2016                                                                       //
//Latest edit date: 23 September 2016                                                              //
//Edit made: Can now (de)select grid squares                                                       //
//Information:                                                                                     //
//                                                                                                 //
//1) Any live cell with fewer than two live neighbours dies, as if caused by under-population.     //
//2) Any live cell with two or three live neighbours lives on to the next generation.              //
//3) Any live cell with more than three live neighbours dies, as if by over-population.            //
//4) Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.  //
//                                                                                                 //
//-------------------------------------------------------------------------------------------------//

//Set variables
int canvas_width = 1920;   //Set canvas width
int canvas_height = 1080;  //Set canvas height
int grid_length = 20;      //Set grid length
int fps = 5;              //Set frame rate
int x = 0;                 //x-coordinate of the top-left corner of a grid square
int y = 0;                 //y-coordinate of the top-left corner of a grid square
int rows = canvas_height / grid_length;  //Number of rows in the grid
int cols = canvas_width / grid_length;   //Number of columns in the grid
boolean[][] state;         //Saves the state of the grid with upper-left coordinates of (x, y) 
boolean[][] buffer;        //Stores the new states of the grid
boolean start;

void setup()         //Function that runs before drawing anything
{
  size(1920, 1080);  //Set the size of the canvas
  frameRate(fps);    //Set frame rate
  background(0);     //Set background to black

  state = new boolean[cols][rows];
  buffer = new boolean[cols][rows];

  start = false;

  int stateX = 0, stateY = 0;

  for (int i = 0; i < canvas_width; i += grid_length)  //x-coordinate of a grid square
  {
    for (int j = 0; j < canvas_height; j += grid_length)  //y-coordinate of a grid square
    {
      fill(0);
      stroke(255);
      rectMode(CORNER);
      rect(i, j, grid_length, grid_length);
      state[stateX][stateY++] = false;
    }
    stateX++;
    stateY = 0;
  }
}

void draw()
{  
  if (start)
  {
    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {          
        int count = 0;

        for (int checkGridx = -1; checkGridx <= 1; checkGridx++)
        {
          for (int checkGridy = -1; checkGridy <= 1; checkGridy++)
          {
            if ((checkGridx == 0 && checkGridy == 0) || 
            (checkGridx + i < 0 || checkGridy + j < 0) || 
            (checkGridx + i > cols - 1 || checkGridy + j > rows - 1))
            {
              continue;
            } else
            {
              if (state[checkGridx + i][checkGridy + j])
              {
                count++;
              }

              if (state[i][j] && (count < 2 || count > 3))
              {
                buffer[i][j] = false;
              } else if(state[i][j] && (count >= 2 && count <= 3))
              {
                buffer[i][j] = true;
              }
              else if (!state[i][j] && count == 3)
              {
                buffer[i][j] = true;
              }
              else if(!state[i][j] && count != 3)
              {
                buffer[i][j] = false;
              }
            }
          }
        }
      }
    }

    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        x = i * grid_length;
        y = j * grid_length;

        state[i][j] = buffer[i][j];

        if (state[i][j])
        {
          fill(255, 255, 0);
        } else
        {
          fill(0);
        }

        rectMode(CORNER);
        rect(x, y, grid_length, grid_length);
      }
    }
  }
}

void mousePressed()
{
  //Find x- and y-coordinate of the mouse cursor when pressed
  //Check the corresponding grid square to fill in
  for (int i = 0; i < cols; i++) 
  {
    for (int j = 0; j < rows; j++) 
    {
      x = i * grid_length;
      y = j * grid_length;
      if (mouseX > x && mouseX < (x + grid_length) && mouseY > y && mouseY < (y + grid_length)) 
      {
        state[i][j] = !state[i][j];

        if (state[i][j])
        {
          fill(255, 255, 0);
        } else
        {
          fill(0);
        }

        rectMode(CORNER);
        rect(x, y, grid_length, grid_length);
      }
    }
  }
}

void keyPressed()
{
  if (key == 's')
  {
    start = !start;
  }
  
  if(start)
  {
    surface.setTitle("Started");
  }
  else
  {
    surface.setTitle("Paused");
  }
}