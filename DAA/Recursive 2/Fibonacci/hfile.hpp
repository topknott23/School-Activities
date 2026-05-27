#include <iostream>
using namespace std;

// int fibonacci(int n){
    
//     if(n == 0) return 0;
//     if(n == 1) return 1;
    
    
//     return fibonacci(n - 1) + fibonacci(n - 2);
    
// }

long long memo[100];

long long fibonacci(int n){
    if(n<= 1) return n;
    
    if(memo[n] != 0) return memo[n];
    
    memo[n] = fibonacci(n - 1) + fibonacci(n -2);
    return memo[n];
}