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
        for(int i = 0; i < size; i++){
            if(array[i] == num){
                shift(i);
                size--;
                double temp = (capacity * 2.0) / 3.0; 
                double sizeTemp = size * 1.0; 

                if(sizeTemp <= temp) {
                    int test = floor(capacity * 0.25);
                    capacity -= test;
                }
                
                if(capacity < 5) capacity = 5;
                
                
                return i + 1;
            }
        }
        return -1;
    }

    int get(int pos) {
        return array[pos-1];
    }
    
    void shift(int i){
        for(int j = i ; j < size - 1; j++){
            array[j] = array[j + 1];
        }
    }
    
    int removeAll(int num){
        int count = 0;
        for(int i = 0; i < size; i++){
            if(array[i] == num){
                shift(i);
                i--;
                size--;
                count++;
            }
        }
        
        double temp = capacity * (3.0/4.0);
        
        if(size <= temp){
            capacity -= floor(capacity * 0.20);
        }
        
        if(capacity < 5) capacity = 5;
        
        
        return count;
    }
    
        // int removeAll(int num){
        //     int count = 0;
        //     for(int i = 0; i < size; i++){
        //         if(array[i] == num){
        //             shift(i);
        //             i--;
        //             size--;
                    
        //             count++;
        //         }
        //     }
            
        //     double temp = floor((3.0 / 4.0) * capacity);
        //     double sizeTemp = size * 1.0;
            
        //     if(sizeTemp <= temp){
        //         int test = floor(capacity * 0.2);
        //         capacity -= test;
        //     }
            
        //     if(capacity < 5) capacity = 5;
            
        //     return count;
            
        // }
    

    // TODO add method removeAll here

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