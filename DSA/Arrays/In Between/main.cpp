#include <iostream>
#include <cstdio>
#include <cmath>
using namespace std;

int main(void){
    int n;
    cout <<"Enter n: ";
    cin >> n;
    int arr[n];
    cout <<"Enter " << n << " elements: "; 
    for(int i = 0; i < n; i++){
        cin >> arr[i];
    }
    int x, y;
    cout <<"Values of x and y: ";
    cin >> x >> y;
    cout <<"Numbers in between = ";
    int count = 0;
    for(int i = 0; i < n; i++){
        if(arr[i] >= x && arr[i] <= y){
            cout << arr[i] << " ";
            count++;
        }
    }
    if(!count){
        cout << "(none)";
    }
}