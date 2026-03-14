#include <iostream>
using namespace std;

int binarySearch(int arr[], int size, int x) {
    int left = 0, right = size - 1;
    
    while (left <= right){
        int mid = left + (right - left) / 2;
        
        if(arr[mid] == x) return mid;
        
        if(arr[mid] < x)left = mid + 1;
        else right = mid - 1;
    }
    return -1;
}

// DO NOT MODIFY
int main() {
    int size;
    cout << "Enter the size of the array: ";
    cin >> size;

    int* arr = new int[size];
    cout << "Enter sorted unique numbers: ";
    for (int i = 0; i < size; ++i) {
        cin >> arr[i];
    }

    int x;
    cout << "Enter the number to search for: ";
    cin >> x;

    int result = binarySearch(arr, size, x);
    if (result != -1) {
        cout << "Number found at index: " << result << std::endl;
    } else {
        cout << "Number not found!" << std::endl;
    }

    return 0;
}