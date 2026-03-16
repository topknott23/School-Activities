// TODO
#include <iostream>
using namespace std;



int helper(int sum, int n){
    if(n == 0) return sum;
    
    sum += n % 10;
    return helper(sum, n / 10);
}

int sumOfDigits(int n){
    return helper(0, n);
}