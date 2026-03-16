// TODO
#include <iostream>
using namespace std;


void evennums(int n){
    if(n <= 1){
        return;
    }
    if(n % 2 == 0){
        cout<< n << " ";
        return evennums(n - 2);
    }
    return evennums(n - 1);
}