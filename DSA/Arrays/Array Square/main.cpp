#include <iostream>
#include <cstdio>
#include <cmath>
using namespace std;

int main(void){
    int arr[5];
    cout<<"Enter 5 integers: "<< endl;
    for(int i = 0; i < 5; i++){
        cin >>arr[i];
    }
    
    cout <<"Square of all elements: " << endl;
    for(int i = 0; i < 5; i++){
        int square = arr[i] * arr[i];
        cout << square << " ";
    }
}