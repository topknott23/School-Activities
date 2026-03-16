// TODO
#include <iostream>
using namespace std;

void helper(int i, int r){
    cout << i * i << endl;
    if(i == r) return ;
    
    return helper(i + 1, r);
}

void recsquares(int n){
    helper(1, n);
}