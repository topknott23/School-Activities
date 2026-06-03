#include <iostream>
using namespace std;

int main(void){
    int arr[5];
    int difference = 0;
    cout <<"Enter 5 integers: \n";
    for(int i = 0; i < 5; i++){
        cin >> arr[i];
    }
    
    for(int i = 0; i < 5; i++){
        difference -= arr[i];
    }
    
    cout << "Difference of all elements: " << difference;
}