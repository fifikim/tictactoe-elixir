<h1 align="center">Tic Tac Toe</h1>

This Tic Tac Toe game is a command line application built in Elixir.

The initial functionality permits gameplay between two human players. The program will exit when gameplay ends: either when a player has won, or if the game has reached a draw.

## Table of Contents

- [Getting Started](#getting_started)
    - [Requirements](#requirements)
    - [Installation](#installation)
    - [Linting](#linting)
    - [Testing](#testing)
- [Usage](#usage)
    - [Launching the Game](#launching)
    - [Instructions](#instructions)
- [Future Implementation](#future)
<br><br>

## Getting Started <a name = "getting_started"></a>

### Requirements <a name = "requirements"></a>

- <a href="https://elixir-lang.org/install.html">Elixir</a> 1.13.4 (use <a href="https://github.com/taylor/kiex">Kiex</a> to switch versions if you have a different version of Elixir currently installed)

### Installation <a name = "installation"></a>

Clone this repo from the terminal:
```
git clone https://github.com/fifikim/tictactoe-elixir.git
```

Navigate to program directory:
```
cd tictactoe-elixir
```  

Install dependencies:
```
mix deps.get
```

### Linting <a name = "linting"></a>

Run the linter:
```
mix credo --strict
```

### Testing <a name = "testing"></a>

Run tests:
```
mix test
```

## Usage <a name="usage"></a>

### Launch the program <a name = "launching"></a>

From program directory:
```
mix start
```

### Instructions

Enter the number (1-9) of the space on the board where you want to move.

Player 1 moves first and marks their spaces with an "X". Player 2 marks with an "O".

To win, claim 3 adjacent spaces in a horizontal, vertical, or diagonal line.

If there are no free spaces and no player has won, the game will end in a draw.

## Future Implementation <a name = "future"></a>
- Add gameplay between a human player vs. Unbeatable AI player
<br><br>
