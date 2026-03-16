// TODO
#include <iostream>

using namespace std;


void helper(int count, int n){
    cout << count << " ";
    
    if(count < n){
        
    helper(count + 1, n);
 
    }
     
}

void allnums(int n){
     helper(1, n);
}