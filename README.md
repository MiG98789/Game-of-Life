# Game of Life

[![https://gyazo.com/81549935070746bc19ada81610b7643d](https://i.gyazo.com/81549935070746bc19ada81610b7643d.gif)](https://gyazo.com/81549935070746bc19ada81610b7643d)

## Introduction
This program simulates Conway's Game of Life. It was made using Processing 3.

In 1970, John Horton Conway created a cellular automaton, called the Game of Life. Although being named a game, there is no player that controls the game, except possibly for the cells which are initially alive/dead.

## Rules
Each cell in the grid can either be alive or dead. 

Any live cell with 2 or 3 live neighbouring cells will stay alive. If a live cell has less than 2 neighbouring cells, it will die, as if by underpopulation. If a live cell has more than 3 neighbouring cells, it will die, as if by overpopulation.

Any dead cell with exactly 3 live neighbouring cells will become alive, as if by reproduction.

## Instructions
Click on a grid cell to set it to alive/dead state. Press the S key to start/pause the simulation. Press the R key to clear the grid.

## Patterns
Even though the rules to the game are simple, there is a plethora of patterns that can be formed. A list of the patterns can be found here: https://en.wikipedia.org/wiki/Category:Cellular_automaton_patterns

## Further Improvements and Modifications
The current algorithm to check whether a cell should be alive or dead in the next generation could be made more efficient (i.e. less iterations of the for loop).