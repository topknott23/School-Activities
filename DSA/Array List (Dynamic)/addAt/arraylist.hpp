#include <iostream>
#include <cstdlib>
#include <cmath>
#include "list.hpp"
using namespace std;

class ArrayList : public List {
    int* array;
    int size;
    int capacity = 5;

    public:
    // constructor
    ArrayList() {
    	array = (int*) calloc( capacity, sizeof(int) );
        size = 0;
    }

   
  
void add(int num) {
        if(size >= capacity){
            // 
            int newCap = ceil(capacity * 1.5);
            array = (int*)realloc(array, newCap * sizeof(int));
            capacity = newCap;
        }
        array[size++] = num;
    }

    


    int remove(int num) {
        return -1;
    }

    int get(int pos) {
        return array[pos-1];
    }

void addAt(int num, int pos){
    if(size >= capacity){
        int neww = ceil(capacity * 1.5);
        array = (int*)realloc(array, neww * sizeof(int));
        capacity = neww;
    }
    
    for(int i = size; i > pos - 1; i--){
        array[i] = array[i - 1];
    }
    array[pos - 1] = num;
    size++;
}

// void addAt(int num, int pos) {
//         if(size >= capacity){
//             int newCap = ceil(capacity * 1.5);
//             array = (int*)realloc(array, newCap * sizeof(int));
//             capacity = newCap;
//         }
        
//         for(int i = size + 1; i > pos - 1; i--){
//             array[i] = array[i - 1];
//         }
        
//         array[pos - 1] = num;
//         size++;
// }


    void print() {
        int i;
        for (i = 0; i < size; i++) {
            cout << array[i] << " ";
        }
        for (; i < capacity; i++) {
            cout << "? ";
        }
        cout << endl;
    }
};