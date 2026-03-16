// TODO factor(int) here
#include <iostream>
using namespace std;

int helper(int cnt, int i, int n){
    if(n % i == 0){
        cnt++;
        cout << i << " ";
    }
    
    if(i == n){
        return cnt;
    }
    
    return helper(cnt, i+1, n);
    
}

int factor(int n){
  return  helper(0, 1, n);
}