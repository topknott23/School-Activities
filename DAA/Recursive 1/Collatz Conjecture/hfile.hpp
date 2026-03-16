// TODO
#include <iostream>
using namespace std;

int helper(int i, int n){
    cout<< n << " ";
    if(n <= i) return i;
    if(n % 2 == 0) return helper(i, n/2);
    else return helper(i, n*3+1);
}

void collatz(int n){
    helper(1, n);
}

// void collatz(int n){
//     cout<< n << " ";
//     if(n == 1) return;
//     if(n % 2 == 0){
//         collatz(n / 2);
//     } else{
//         collatz(n * 3+1);
//     }