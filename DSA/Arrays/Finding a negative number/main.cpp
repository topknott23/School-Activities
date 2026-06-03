#include <iostream>
#include <cstdio>
#include <cmath>
using namespace std;

int main(void){
    int arr[8];
    int count = 0;
    
    cout <<"Enter 8 integers: " << endl;
    for(int i = 0; i < 8; i++){
        cin >> arr[i];
        if (arr[i] < 0) count++;
    }
    
    if(!count){
        cout <<"No negative numbers";
    }else{
        cout <<"Negative number found";
    }

}