#include "list.hpp"
#include <cstdlib>
#include <iostream>
#include <cmath>
using namespace std;
/**
 * Your ArrayList must have an initial capacity of 4.
 * If the array is full, allocate an additional capacity of 50% its current size.
 * Example, 4 becomes 6, then 6 becomes 9, so on.
 * Maintain a minimum capacity of 4.
 *
 * On the fields:
 * array - holds the pointer to the array itself
 * index - holds the current size, initially zero
 * capacity - holds the current capacity of the array - minimum of 4
 */
class ArrayList : public List {
    int* array;
    int index;
    int capacity;
    
    void resize(){
        // int increase = capacity / 2;
        // if(capacity % 2 != 0) increase++;
        // capacity += increase;
        capacity = ceil(capacity * 1.5);
        
        // capacity = capacity + (capacity / 2);
        int* newArr = new int[capacity];
        for(int i = 0; i < index; i++){
            newArr[i] = array[i];
        }
        delete[] array;
        array = newArr;
        
    }

    public:
        // CONSTRUCTOR
        ArrayList() {
            capacity = 4;
            index = 0;
            array = new int[capacity];
        }

        int add(int num) {
          if(index == capacity) resize();
          
          array[index] = num;
          int addedPos = index;
          index++;
          return index;
        }

        int get(int pos){

          
          return array[pos];
        }

        int size(){
            return index;
        }

        void swap(int pos1, int pos2){
    
        
        int temp = array[pos1];
        array[pos1] = array[pos2];
        array[pos2] = temp;
        }

        // WARNING! Do not modify the print method.
        // Doing so will nullify your score for this activity.
        void print() {
            cout << "[";
            for (int i = 0; i < capacity; i++) {
                if (i < index) {
                    cout << *(array + i);
                } else {
                    cout << "?";
                }

                if (i != capacity - 1) {
                    cout << ", ";
                }
            }
            cout << "]" << endl;
        }
};