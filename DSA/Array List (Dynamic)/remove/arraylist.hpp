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
            // 
            int newCap = ceil(capacity * 1.5);
            array = (int*)realloc(array, newCap * sizeof(int));
            capacity = newCap;
        }
        array[size++] = num;
    }
    
    void shift(int i){
        for(int j = i; j < size - 1; j++){
            array[j] = array[j + 1];
        }
    }

int remove(int num){
    for(int i = 0 ; i < size; i++){
        if(array[i] == num){
            shift(i);
            size--;
            double temp = capacity * (2.0/3.0);
            
            if(size <= temp){
                capacity -= floor(capacity * 0.25);
            }
            
            if(capacity < 5) capacity = 5;
            return i + 1;
        }
    }       
    return -1;
}



// int remove(int num) {
//         for(int i = 0; i < size; i++){
//             if(array[i] == num){
//                 shift(i);
//                 size--;
//                 double temp = (capacity * (2.0 / 3.0)); 


//                 if(size <= temp) {
//                     capacity -= floor(capacity * 0.25);
                    
//                 }
                
//                 if(capacity < 5) capacity = 5;
                
                
//                 return i + 1;
//             }
//         }
//         return -1;
//     }



    int get(int pos) {
        return array[pos-1];
    }

    void print() {
        cout << "Size: " << size << "/" << capacity << endl;
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