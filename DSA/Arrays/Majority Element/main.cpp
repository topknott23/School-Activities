#include <iostream>
#include <cstdio>
#include <cmath>
#include <map>
using namespace std;

int main(void){
    int size;
    cout <<"Enter the size of the array: ";
    cin>>size;
    int arr[size];
    cout <<"Enter the elements of the array separated by space: ";
    for(int i = 0; i < size; i++){
        cin >> arr[i];
    }
    
    
    int candidate = arr[0], count = 1;
    for(int i = 1; i < size; ++i){
    if(arr[i] == candidate) {
        count++;
    }else{
        count--;
        if(count == 0){
            candidate = arr[i];
            count = 1;
        }
    }
    }
    
    count  = 0;
    for(int i = 0; i < size; ++i){
        if(arr[i] == candidate){
            count++;
        }
    }
    
    
    if(count > size / 2){
        cout << "The majority element is " << candidate;
        
    }else{
        cout << "No majority element found";
    }
//     map<int, int>freq;
    
//     for(int i = 0; i < size; i++){
//         freq[arr[i]]++;
//     }
    
//   int largest = 0;
    
//     for(auto it : freq){
//         if(it.second > largest){
//             largest = it.first;
//         }
//     }
    
    
//     if(largest == 1){
//         cout << "No majority element found";
//     }else{
//         if(largest > (size / 2)){
//         cout <<"The majority element is "<< largest;
//     }else{
//          cout << "No majority element found";
//     }
// }
}