#include <iostream>
using namespace std;

int* array;
int n;
void print();
void sort_pivot(int, int);

int main(void) {
    // Hey there, start typing your C++ code here...
    cout << "Enter number of elements: ";
    cin >> n;
    array = (int*) malloc(n * sizeof(int));
    for (int i = 0; i < n; i++) {
        cout << "Enter element " << i+1 << ": ";
        cin >> array[i];
    }

    sort_pivot(0, n-1);
    cout << "Finish: ";
    print();

    return 0;
}

// TODO implement the sort_pivot method recursively
void sort_pivot(int start, int end) {
    if(start >= end) return;
    
    cout << "Start: " << start << " | End: " << end << endl;
    print();
    
    // Step 1: Identify pivot
    int pivot = array[start];
    int last = start;
    
    // Step 2: From after the pivot, go through the rest of the elements and print every swap
    for(int j = start + 1; j <= end; j++){
        if(array[j] < pivot){
            last++;
            if(last != j){
            int temp = array[last];
            array[last] = array[j];
            array[j] = temp;
             print();
            }
        }
    }
        
    // Step 3: Swap the pivot to the last green and print, if applicable
        if(start != last){
            int temp = array[start];
            array[start] = array[last];
            array[last] = temp;

           print();
        }
    
    // Step 4: Recursive call to the left partition, if applicable
    if(start < last - 1){
    cout << "Left Partition of " << pivot << endl;
    sort_pivot(start, last - 1);
    }

    // Step 5: Recursive call to the right partition, if applicable
   if(last + 1 < end) {
    cout << "Right Partition of " << pivot << endl;
    sort_pivot(last + 1, end);
   }
}

void print() {
    cout << "[";
    for (int i = 0; i < n; i++) {
        cout << array[i];
        if (i < n-1) {
            cout << ", ";
        }
    }
    cout << "]" << endl;
}