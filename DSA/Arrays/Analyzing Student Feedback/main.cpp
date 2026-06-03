#include <iostream>
#include <cstdio>
#include <cmath>
#include <map>
using namespace std;
int main(void){
    int n, rate;
    cout <<"Enter n: ";
    cin >> n;
    int arr[n];
    cout << "Enter " << n << " elements: ";
    for(int i = 0; i < n; i++){
        cin >> arr[i];
    }
    
    cout <<"Rating to count: ";
    cin >> rate;
    
    map<int,int>freq;
    
    for(int i = 0; i < n; i++){
        freq[arr[i]]++;
    }
    int e; 
    for(auto it : freq){
        if(it.first == rate){
            e = it.second;
        }
    }
    
    cout <<"FREQUENCY = "<< e;
}