#include <iostream>
#include <cstdio>
#include <cmath>
#include <map>
using namespace std;

int main(void){
    int n;
    cout <<"Enter the number of elements: ";
    cin >> n;
    int arr[n];
    
    
    cout <<"Enter elements: ";
    for(int i = 0; i < n; i++){
        cin >> arr[i];
        }
        int largest, second;
        if(arr[0] > arr[1]){
     largest = arr[0];
     second = arr[1];
        }
        
        if(arr[1] > arr[0]){
         largest = arr[1];
     second = arr[0];
        }
    
    for(int i = 0; i < n ; i++){
        if(arr[i] > largest){
            second = largest;
            largest = arr[i];
        }else if(arr[i] > second && arr[i] != largest){
            second = arr[i];
        }
    }
    cout <<"The second largest element is " << second;
    
}