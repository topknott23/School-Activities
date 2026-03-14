#include <iostream>
using namespace std;

int *findTwoNumbers(int arr[], int size, int target) {
    
    for(int i = 0; i < size; i++){
        for(int j = i + 1; j < size; j++){
            if(arr[i] + arr[j] == target){
                int* returner = new int[2];
                returner[0] = arr[i];
                returner[1] = arr[j];
                return returner;
            }
        }
    }
    
    return nullptr;
}

// DO NOT MODIFY below
#include "hidden.hpp"

int main() {
    int size;
    cout << "Enter the size of the array: ";
    cin >> size;

    int* arr = new int[size];
    cout << "Enter the sorted list of numbers: ";
    for (int i = 0; i < size; ++i) {
        cin >> arr[i];
    }

    int target;
    cout << "Enter the target value: ";
    cin >> target;

    int* result = findTwoNumbers(arr, size, target);
    if (result != nullptr) {
        if (find(arr, size, result[0]) + find(arr,size,result[1]) == 2 && result[0] + result[1] == target) {
            cout << "Two numbers found." << endl;
        } else {
            cout << "Either the numbers do not exist or " << result[0] << " and " << result[1] << " do not add to " << target << endl;
        }
        delete[] result;

    } else {
        cout << "No two numbers found that sum to the target." << endl;
    }

    delete[] arr;
    return 0;
}