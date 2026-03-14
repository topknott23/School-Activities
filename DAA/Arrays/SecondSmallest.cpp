#include <iostream>
#include <climits>
using namespace std;
int arraySecondSmallest(int* array, int n){
    
     int min = INT_MAX;
    int sec = INT_MAX;
    
    for(int i = 0; i < n; i++){
        if(array[i] < min){
            sec = min;
            min = array[i];
        }else if(array[i] < sec && array[i] != min){
            sec = array[i];
        }
    }
    return sec;
}

int main(void){
   
    int n;
    cout<<"Enter number of elements: ";
    cin>>n;
    int arr[n];
    
    for(int i = 0; i < n; i++){
        cout<<"Enter element "<< i+1 << ": ";
        cin >> arr[i];
    } 
    

        int sec = arraySecondSmallest(arr, n);
    
    cout <<"The second smallest element is " << sec;
}