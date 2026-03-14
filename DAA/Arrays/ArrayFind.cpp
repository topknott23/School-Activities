#include <iostream>
using namespace std;

int arrayFind(int* array, int num, int n){
    int ind;
    for(int i = 0; i < num; i++){
        if(array[i] == n){
            ind = i+1;
            return ind;
        }
    }
    return 0;
}

int main(void){
    int n;
    cout<<"Enter number of elements: ";
    cin >>n;
    
    int arr[n];
    for(int i = 0; i < n; i++){
        cout<<"Enter element "<<i+1 << ": ";
        cin>>arr[i];
    }
    
    int find;
    cout<<"Number to find: ";
    cin>>find;
    
   
    
    if(arrayFind(arr, n, find) > 0){
        cout << find <<" is at position " << arrayFind(arr, n, find);
    }else{
        cout<< find << " is not there";
    }
}