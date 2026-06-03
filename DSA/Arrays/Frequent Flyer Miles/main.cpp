#include <iostream>
#include <cstdio>
#include <cmath>
#include <map>
using namespace std;

int main(void){
    int n;
    cout << "Enter n: ";
    cin >> n;
    
    int arr[n];
    cout<<"Enter " << n << " elements: ";
    for(int i = 0; i < n; i++){
        cin >> arr[i];
    }
    
    map<int,int>freq;
    for(int i = 0; i < n; i++){
        freq[arr[i]]++;
    }
    
    int max = 0;
    for(auto it:freq){
        if(it.second > max){
            max = it.second;
        }
    }
    
    int countMax = 0;
    int winner = -1;
    
    for(auto it : freq){
        if(it.second == max){
            countMax++;
            winner = it.first;
            if(countMax > 1){
             cout << "Lucky Winner = (none)";
             return 0;
            } 
        }
    }
    
    cout << "Lucky Winner = "<< winner;
}