#include <iostream>
#include <cstdio>
#include <cmath>
#include <map>
using namespace std;

int main(void){
    int arr[7];
    int largest = -99;
    cout <<"Enter 7 integers: \n";
    for(int i = 0; i < 7; i++){
        cin >> arr[i];
        if(largest < arr[i]){
            largest = arr[i];
        }
    }
    
    cout << "The maximum value is: " << largest;
    
}