//-------------------------------------------------------------------//
//Editor: Gian Miguel Del Mundo                                      //
//Creation date: 3 June 2016                                         //
//Latest edit date: 23 September 2016                                //
//Edit made: Can now (de)select grid squares                         // 
//-------------------------------------------------------------------//


//Set variables
int canvas_width = 1920;   //Set canvas width
int canvas_height = 1080;  //Set canvas height
int grid_length = 20;      //Set grid length
int fps = 200;             //Set frame rate
int dps = 500;             //Number of times draw() is looped
int x = 0;                 //x-coordinate of the top-left corner of a grid square
int y = 0;                 //y-coordinate of the top-left corner of a grid square
int rows = canvas_height / grid_length;  //Number of rows in the grid
int cols = canvas_width / grid_length;   //Number of columns in the grid
boolean[][] state;         //Saves the state of the grid with upper-left coordinates of (x, y)
int saved_i = -1;          //
int saved_j = -1;

void setup()         //Function that runs before drawing anything
{
  size(1920, 1080);  //Set the size of the canvas
  frameRate(fps);    //Set frame rate
  background(0);     //Set background to black
  
  state = new boolean[cols][rows];
  
  int stateX = 0, stateY = 0;
  
  for(int i = 0; i < canvas_width; i += grid_length)  //x-coordinate of a grid square
  {
    for(int j = 0; j < canvas_height; j += grid_length)  //y-coordinate of a grid square
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
  for(int times = 0; times < dps; times++)
  {
     
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
        if(!state[i][j])
        {
          fill(255);
        }
        else
        {
          fill(0);
        }
        
        rectMode(CORNER);
        rect(x, y, grid_length, grid_length);
        state[i][j] = !state[i][j];
      }
    }
  }
}