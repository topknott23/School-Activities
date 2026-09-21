#include <iostream>
#include <cstdlib>
#include <math.h>
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
        
            int newCap = ceil(capacity * 1.5);
            array = (int*)realloc(array, newCap * sizeof(int));
            capacity = newCap;
        }
        array[size++] = num;
    }



    int remove(int num) {
        return 0;
    }

    int get(int pos) {
        return array[pos-1];
    }

    void print() {
        cout << "Size: " << size << " / " << capacity << endl;
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