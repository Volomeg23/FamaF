#include <stdlib.h>  /* exit() y EXIT_FAILURE */
#include <stdio.h>   /* printf(), scanf()     */
#include <stdbool.h> /* Tipo bool             */

#include <assert.h>  /* assert() */

#define BOARD_SIZE 3
#define CELL_MAX (BOARD_SIZE * BOARD_SIZE - 1)

void print_board(char board[BOARD_SIZE][BOARD_SIZE])
{
    int cell = 0;
    printf("\t .................................................\n");
    for (int row = 0; row < BOARD_SIZE; ++row) {
        for (int column = 0; column < BOARD_SIZE; ++column) {
            printf("\t | %d: %c ", cell, board[row][column]);
            ++cell;
        }
        printf("\t | \n");
        printf("\t .................................................\n");
    }
}

char get_winner(char board[BOARD_SIZE][BOARD_SIZE]){
    char winner = '-';
    if(board[0][0] == 'O' && board[0][1] == 'O' && board[ 0 ][ 2 ] == 'O') {

        winner = 'O';

     } else if(board[1][0] == 'O' && board[1][1] == 'O' && board[1][2] == 'O') {

        winner = 'O';

     } else if(board[ 2 ][0] == 'O' && board[ 2 ][1] == 'O' && board[ 2 ][2] == 'O') {

        winner = 'O';

     } else if(board[ 0 ][0] == 'X' && board[ 0 ][1] == 'X' && board[ 0 ][2] == 'X') {

        winner = 'X';

     } else if(board[ 1][0] == 'X' && board[1][1] == 'X' && board[ 1 ][2] == 'X') {

        winner = 'X';

     } else if(board[ 2 ][0] == 'X' && board[ 2 ][1] == 'X' && board[ 2 ][2] == 'X') {

        winner = 'X';

        } else if(board[0][0] == 'O' && board[1][0] == 'O' && board[2][0] == 'O') {

        winner = 'O';

        } else if(board[0][1] == 'O' && board[1][1] == 'O' && board[2][1] == 'O') {

        winner = 'O';

        } else if(board[0][2] == 'O' && board[1][2] == 'O' && board[2][2] == 'O') {

        winner = 'O';

        } else if(board[0][0] == 'X' && board[1][0] == 'X' && board[2][0] == 'X') {

        winner = 'X';

        } else if(board[0][1] == 'X' && board[1][1] == 'X' && board[2][1] == 'X') {

        winner = 'X';

        } else if(board[0][2] == 'X' && board[1][2] == 'X' && board[2][2] == 'X') {

        winner = 'X';


    }


     
     if(board[ 0 ][0] == 'X' && board[ 1 ][1] == 'X' && board[ 2 ][2] == 'X') {

        winner = 'X';

     } else if(board[ 2 ][0] == 'X' && board[ 1 ][1] == 'X' && board[ 0 ][2] == 'X') {

        winner = 'X';
     }


     if(board[ 0 ][0] == 'O' && board[ 1 ][1] == 'O' && board[ 2 ][2] == 'O') {

        winner = 'O';

     } else if(board[ 2 ][0] == 'O' && board[ 1 ][1] == 'O' && board[ 0 ][2] == 'O') {

        winner = 'O';
     }


     if(winner == 'X') {

        printf("\nX WON\n");
        return winner; 
     }


     if(winner == 'O') {

        printf("\nO WON\n");
        return winner; 
     }
     return winner;
}

bool has_free_cell(char board[BOARD_SIZE][BOARD_SIZE])
{
  for(int i = 0; i < 3; ++i) {
    for(int j = 0; j < 3; ++j) {
      if (board[i][j] == '-') {
        return true;
      }
    }
  }
  return false;
}

int main(void)
{
    printf("TicTacToe\n");

    char board[BOARD_SIZE][BOARD_SIZE] = {
        { '-', '-', '-' },
        { '-', '-', '-' },
        { '-', '-', '-' }
    };

    char turn = 'X';
    char winner = '-';
    int cell = 0;
    while (winner == '-' && has_free_cell(board)) {
        print_board(board);
        printf("\nTurno %c - Elija posición (número del 0 al 8): ",
               turn);
        int scanf_result = scanf("%d", &cell);
        if (scanf_result <= 0) {
            printf("Error al leer un número desde teclado\n");
            exit(EXIT_FAILURE);
        }
        if (cell >= 0 && cell <= CELL_MAX) {
            int row = cell / BOARD_SIZE;
            int colum = cell % BOARD_SIZE;
            if (board[row][colum] == '-') {
                board[row][colum] = turn;
                turn = turn == 'X' ? 'O' : 'X';
                winner = get_winner(board);
            } else {
                printf("\nCelda ocupada!\n");
            }
        } else {
            printf("\nCelda inválida!\n");
        }
    }
    print_board(board);
    if (winner == '-') {
        printf("Empate!\n");
    } else {
        printf("Ganó %c\n", winner);
    }
    return 0;
}
