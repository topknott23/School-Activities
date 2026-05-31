#include <iostream>
#include "list.hpp"
using namespace std;

class ArrayList : public List {
    int array[5];
    int size;

    public:

    void add(int num) {
        if (size < 5) {
            array[size++] = num;
        } else {
            cout << "Array full" << endl;
        }
    }

    int get(int pos) {
        return array[pos-1];
    }

    // TODO implement method removeAt here
    
   int removeAt(int pos){
       int res = array[pos - 1];
       for(int i = pos - 1; i < size; i++){
           array[i] = array[i + 1];
       }
       array[size - 1] = 0;
       size--;
       return res;
   }
    
    // int removeAt(int pos){
    //     int res = array[pos-1];
    //     for(int j = pos-1; j < size -1; j++){
    //         array[j] = array[j+1];
    //     }
        
    //     array[size-1] = 0;
    //     size = size-1;
        
    //     return res;
    // }

    void print() {
        for (int i = 0; i < 5; i++) {
            cout << array[i] << " ";
        }
        cout << endl;
    }
};