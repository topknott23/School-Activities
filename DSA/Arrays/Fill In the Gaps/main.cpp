#include <iostream>
#include <cstdio>
using namespace std;

int main(void){
    int n;
    
    cout <<"Enter n: ";
    cin >> n;
    
    int arr[n];
    
   printf("Enter %d elements: ", n);
    for(int i = 0; i < n; i++){
        cin >> arr[i];
    }
    cout <<"Filling in gaps = ";
    
    int count = 0;
    for(int i = 0; i < n - 1; ++i){
       for(int j = arr[i] + 1; j < arr[i + 1]; ++j){
           cout << j << " ";
           count++;
       }
    }
    
    if(!count){
        cout << "(none)";
    }
    
}