#include <iostream>
using namespace std;

const int N = 9;

bool isValid(int board[N][N], int row, int col, int num){
    for(int i = 0; i < N; i++){
        if(board[row][i] == num || board[i][col] == num){
            return false;
        }
    }
    
    int sRow = row - (row % 3);
    int sCol = col - (col % 3);
    for(int i = 0; i < 3; i++){
        for(int j = 0; j < 3; j++){
            if(board[i + sRow][j + sCol] == num){
                return false;
            }
        }
    }
    return true;
}

bool solveSudoku(int board[N][N]){
    int row = -1;
    int col = -1;
    bool isEmpty = false;
    
    for(int i = 0; i < N; i++){
        for(int j = 0; j < N; j++){
            if(board[i][j] == 0){
                row = i;
                col = j;
                isEmpty = true;
                break;
            }
        }
        if(isEmpty) break;
    }
    if(!isEmpty) return true;
    
    for(int j = 1; j <= 9; j++){
        if(isValid(board,row,col,j)){
            board[row][col] = j;
            
            if(solveSudoku(board)){
                return true;
            }
            board[row][col] = 0;
        }
    }
    return false;
}

void printBoard(int board[N][N]){
    for(int i = 0; i < N; i++){
        for(int j = 0; j < N; j++){
            cout << board[i][j] << " ";
        }
        cout << "\n";
    }
}

int main(){
    int board[N][N];
    
    cout <<"Enter the Sudoku board:\n";
    for(int i  = 0; i < N; i++){
        for(int j = 0; j < N; j++){
            cin >> board[i][j];
        }
    }
    
    if(solveSudoku(board)) {
        cout<<"\nSolved Board:\n";
        printBoard(board);
    }
    
    return 0;
}