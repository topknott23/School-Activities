// TODO
#include <iostream>
using namespace std;
void between(int n,int m){
    cout << n << " ";
      if(n == m){
        return;
    }
   
    return between(n + 1, m);
}