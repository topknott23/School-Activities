#include <iostream>
using namespace std;

int main(void){
    int arr[12];
    cout<<"Enter 12 integers: " << endl;
    for(int i = 0; i < 12; i++){
        cin >> arr[i];
    }
    int count = 0;
    for(int i = 0; i < 12; i++){
        if(arr[i] % 2 == 0){
            count++;
        }
    }
    
    cout << "Number of even elements: "  << count;
}