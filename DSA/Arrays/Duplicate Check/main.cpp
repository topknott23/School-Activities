#include <iostream>
#include <cstdio>
#include <cmath>
#include <map>
using namespace std;

int main(void){
    int arr[10];
    
    cout << "Enter 10 integers: \n";
    for(int i = 0; i < 10; i++){
        cin >> arr[i];
    }
    
    map<int, int>freq;
    for(int i = 0; i < 10; i++){
        freq[arr[i]]++;
    }
    int count = 0;
    for(auto it : freq){
        if(it.second == 2){
            count++;
            break;
        }
    }
    
    if(!count){
        cout << "No duplicates";
    }else{
        cout <<"Duplicate found";
    }
}